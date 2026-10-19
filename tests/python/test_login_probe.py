"""Independent local TCP integration tests; uses synthetic credentials only."""
import hashlib
import hmac
import os
from pathlib import Path
import socket
import struct
import subprocess
import sys
import tempfile
import threading

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
CLASSES = ROOT / 'build' / 'classes'
JAVA = sys.argv[1] if len(sys.argv) > 1 else 'java'


def cu(n):
    if n < 128:
        return bytes([n])
    if n < 16384:
        return struct.pack('>H', n | 0x8000)
    return struct.pack('>I', n | 0xc0000000)


def octets(b):
    return cu(len(b)) + b


def packet(t, b):
    return cu(t) + octets(b)


def exact(conn, n):
    b = b''
    while len(b) < n:
        part = conn.recv(n-len(b))
        if not part:
            raise EOFError('truncated TCP frame')
        b += part
    return b


class RC4:
    def __init__(self, key):
        self.s = list(range(256))
        self.i = self.j = 0
        j = 0
        for i in range(256):
            j = (j + self.s[i] + key[i % len(key)]) & 255
            self.s[i], self.s[j] = self.s[j], self.s[i]

    def apply(self, data):
        out = bytearray()
        for b in data:
            self.i = (self.i + 1) & 255
            self.j = (self.j + self.s[self.i]) & 255
            self.s[self.i], self.s[self.j] = self.s[self.j], self.s[self.i]
            out.append(b ^ self.s[(self.s[self.i] + self.s[self.j]) & 255])
        return bytes(out)


def mppc_literal(data):
    bits = ''.join(format(b, '08b') if b < 128 else '10' + format(b & 127, '07b') for b in data)
    bits += '1111000000'  # End-of-block marker, then byte padding.
    bits += '0' * (-len(bits) % 8)
    return bytes(int(bits[i:i+8], 2) for i in range(0, len(bits), 8))


def mppc_matches(data):
    parts = []
    i = 0
    while i < len(data):
        j = data.rfind(data[i:i+3], max(0, i-8191), i) if i+3 <= len(data) else -1
        if j < 0:
            b = data[i]
            parts.append(format(b, '08b') if b < 128 else '10' + format(b & 127, '07b'))
            i += 1
            continue
        offset = i-j
        length = 3
        while i+length < len(data) and data[i+length] == data[i+length-offset]:
            length += 1
        if offset < 64:
            parts.append('1111' + format(offset, '06b'))
        elif offset < 320:
            parts.append('1110' + format(offset-64, '08b'))
        else:
            parts.append('110' + format(offset-320, '013b'))
        if length == 3:
            parts.append('0')
        else:
            w = length.bit_length()-1
            parts.append('1'*(w-1)+'0'+format(length-(1<<w), '0%db' % w))
        i += length
    bits = ''.join(parts) + '1111000000'
    bits += '0' * (-len(bits) % 8)
    return bytes(int(bits[i:i+8], 2) for i in range(0, len(bits), 8))


def case(mode):
    errors = []
    listener = socket.socket()
    listener.bind(('127.0.0.1', 0))
    listener.listen(1)
    port = listener.getsockname()[1]
    nonce = os.urandom(16)
    def server():
        try:
            conn, _ = listener.accept()
            with conn:
                conn.settimeout(15)
                conn.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
                algo = 1 if mode == 'unsupported_algo' else 0
                body = octets(nonce) + struct.pack('>I', 386) + octets(b'df8e814') + bytes([algo]) + struct.pack('>I', 0)
                for b in packet(1, body):
                    conn.sendall(bytes([b]))
                if mode in ('probe', 'unsupported_algo'):
                    assert conn.recv(1) == b'', 'unexpected application write'
                    return
                digest = hmac.new(hashlib.md5(b'test123test-password').digest(), nonce, hashlib.md5).digest()
                expected = packet(3, octets(b'test123') + struct.pack('>i', 0) + b'\x00' + octets(digest) + octets(b''))
                assert exact(conn, len(expected)) == expected, 'Response differs from independent Python implementation'
                if mode in ('keyexchange', 'secure_online', 'secure_error', 'secure_matches', 'secure_reset'):
                    server_nonce = b'0123456789abcdef'
                    conn.sendall(packet(2, octets(server_nonce)))
                elif mode == 'error':
                    conn.sendall(packet(5, struct.pack('>i', 123) + octets(b'test rejection')))
                elif mode == 'disconnect':
                    return
                if mode == 'keyexchange':
                    assert conn.recv(1) == b'', 'probe unexpectedly completed key exchange'
                if mode in ('secure_online', 'secure_error', 'secure_matches', 'secure_reset'):
                    secret = hashlib.md5(b'test123test-password').digest()
                    client_cipher = RC4(hmac.new(secret, server_nonce, hashlib.md5).digest())
                    reply = client_cipher.apply(exact(conn, 19))
                    assert reply[:3] == b'\x02\x11\x10', reply.hex()
                    client_nonce = reply[3:]
                    assert len(client_nonce) == 16
                    server_cipher = RC4(hmac.new(secret, client_nonce, hashlib.md5).digest())
                    if mode in ('secure_online', 'secure_matches', 'secure_reset'):
                        # Two independently compressed blocks share RC4 stream state.
                        if mode == 'secure_matches':
                            payload = bytes(range(256))*3 + b'A'*4096
                            unknown = packet(999, payload)
                            first = mppc_matches(unknown)
                        elif mode == 'secure_reset':
                            unknown = packet(999, b'x'*8188)
                            assert len(unknown) == 8192
                            first = mppc_literal(unknown)
                        else:
                            unknown = packet(999, bytes([0, 127, 128, 255]))
                            first = mppc_literal(unknown)
                        online = packet(4, struct.pack('>ii', 55818, 1))
                        wire = server_cipher.apply(first + mppc_literal(online))
                    else:
                        wire = server_cipher.apply(mppc_literal(packet(5, struct.pack('>i', 456) + octets(b'encrypted rejection'))))
                    step = 7 if len(wire) > 1024 else 1
                    for offset in range(0, len(wire), step):
                        conn.sendall(wire[offset:offset+step])
                    assert conn.recv(1) == b''
        except Exception as e:
            errors.append(e)
        finally:
            listener.close()
    thread = threading.Thread(target=server, daemon=True)
    thread.start()
    with tempfile.TemporaryDirectory() as tmp:
        cfg = Path(tmp) / 'test.conf'
        cfg.write_text('[Account]\nprefix=test\nstart=123\nend=124\npassword=test-password\n', encoding='ascii')
        cmd = [JAVA, '-cp', str(CLASSES), 'XajhLoginProbe', '--host', '127.0.0.1', '--port', str(port), '--timeout', '10', '--account', 'test123', '--config', str(cfg)]
        if mode == 'probe':
            cmd.append('--probe-only')
        if mode == 'keyexchange':
            cmd.append('--stop-at-keyexchange')
        if mode in ('secure_online', 'secure_error', 'secure_matches', 'secure_reset'):
            cmd.append('--stop-after-online')
        p = subprocess.run(cmd, capture_output=True, timeout=25)
        output = (p.stdout + p.stderr).decode('utf-8', errors='replace')
        assert 'test-password' not in output
        expected_code = {'probe': 0, 'keyexchange': 0, 'error': 2, 'unsupported_algo': 1, 'disconnect': 1, 'secure_online': 0, 'secure_error': 2, 'secure_matches': 0, 'secure_reset': 0}[mode]
        assert p.returncode == expected_code, (mode, p.returncode, output, errors)
        if mode == 'keyexchange':
            assert 'KEYEXCHANGE_RECEIVED' in output
        if mode == 'error':
            assert 'SERVER_ERROR code=123' in output
        if mode in ('secure_online', 'secure_matches', 'secure_reset'):
            assert 'ONLINE_ANNOUNCE userid=55818 zoneid=1' in output
            if mode == 'secure_matches':
                assert 'SECURE_PACKET payload_hex=' + (bytes(range(256))*3 + b'A'*4096).hex() in output
            if mode == 'secure_reset':
                assert 'SECURE_PACKET payload_hex=' + (b'x'*8188).hex() in output
        if mode == 'secure_error':
            assert 'SERVER_ERROR code=456' in output
    thread.join(6)
    assert not thread.is_alive(), 'server test did not finish'
    if errors:
        raise errors[0]
    print('PASS:', mode)


if __name__ == '__main__':
    for name in ('probe', 'keyexchange', 'error', 'unsupported_algo', 'disconnect', 'secure_online', 'secure_error', 'secure_matches', 'secure_reset'):
        case(name)
