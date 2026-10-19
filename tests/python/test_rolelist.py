"""RoleList end-to-end fixtures built independently of the Java parser."""
import hashlib
import hmac
from pathlib import Path
import socket
import struct
import subprocess
import tempfile
import threading
from test_login_probe import JAVA, HERE, ROOT, CLASSES, RC4, octets, packet, exact, mppc_literal


def record(roleid, name='測試角色', equipment=True):
    b = struct.pack('>q', roleid) + octets(name.encode('utf-16le'))
    b += bytes(range(11)) + octets(b'appearance') + b'\x03' + struct.pack('>i', 45)
    b += octets(b'custom') + octets(b'mode')
    if equipment:
        b += b'\x01' + struct.pack('>Ihhh', 123, -1, 2, 1) + octets(b'item-data') + struct.pack('>iiq', 7, 8, 0x123456789abc)
    else:
        b += b'\x00'
    b += struct.pack('>biiiHbi', 1, 100, 0, 200, 20586, 0, 0)
    return b


def page(roleid, nextid=0, uid=32, result=0):
    return struct.pack('>iqiI', result, nextid, uid, 12345) + record(roleid)


def case(mode):
    listener = socket.socket()
    listener.bind(('127.0.0.1', 0))
    listener.listen(1)
    port = listener.getsockname()[1]
    errors = []
    roleid = (1 << 54) + 123
    cursor = 0x1234567887654321

    def serve():
        try:
            conn, _ = listener.accept()
            with conn:
                conn.settimeout(15)
                conn.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
                challenge_nonce = b'challenge-nonce!'
                assert len(challenge_nonce) == 16
                body = octets(challenge_nonce) + struct.pack('>I', 386) + octets(b'df8e814') + b'\x00' + struct.pack('>I', 0)
                conn.sendall(packet(1, body))
                secret = hashlib.md5(b'test123test-password').digest()
                digest = hmac.new(secret, challenge_nonce, hashlib.md5).digest()
                expected = packet(3, octets(b'test123') + struct.pack('>i', 0) + b'\x00' + octets(digest) + octets(b''))
                assert exact(conn, len(expected)) == expected
                server_nonce = b'0123456789abcdef'
                conn.sendall(packet(2, octets(server_nonce)))
                tx_from_client = RC4(hmac.new(secret, server_nonce, hashlib.md5).digest())
                reply = tx_from_client.apply(exact(conn, 19))
                assert reply[:3] == b'\x02\x11\x10'
                tx_to_client = RC4(hmac.new(secret, reply[3:], hashlib.md5).digest())
                def send(t, b):
                    conn.sendall(tx_to_client.apply(mppc_literal(packet(t, b))))
                def request(nextid):
                    expected = packet(82, struct.pack('>iiI', 32, 0, nextid & 0xffffffff))
                    got = tx_from_client.apply(exact(conn, len(expected)))
                    assert got == expected, (got.hex(), expected.hex())
                send(4, struct.pack('>ii', 32, 20586))
                request(-1)
                if mode.startswith('select_'):
                    send(83, page(roleid))
                    if mode != 'select_missing':
                        expected = packet(70, struct.pack('>qqb', roleid, 0, 0))
                        assert tx_from_client.apply(exact(conn, len(expected))) == expected
                        result = 27 if mode in ('select_rejected', 'select_rejected_enter') else 0
                        selected_uid = 999 if mode == 'select_wrong_user' else 32
                        body = struct.pack('>iiiHfff', result, selected_uid, 1, 2, 10.5, 20.25, -30.5) + octets(b'auth-token')
                        if mode == 'select_finish':
                            send(34, octets(bytes.fromhex('3400a20800000000000000')))
                        send(71, body)
                        if mode in ('select_finish', 'select_finish_timeout', 'select_finish_error', 'select_finish_target', 'select_finish_target_missing'):
                            expected = packet(72, struct.pack('>qb', roleid, 0))
                            assert tx_from_client.apply(exact(conn, len(expected))) == expected
                            if mode == 'select_finish':
                                send(34, octets(struct.pack('<H', 2222) + bytes(range(256))*2))
                            if mode in ('select_finish_target', 'select_finish_target_missing'):
                                self_data = bytearray(79)
                                struct.pack_into('<Hq', self_data, 0, 5, roleid)
                                struct.pack_into('<fff', self_data, 25, 10.5, 20.25, -30.5)
                                send(34, octets(self_data))
                                npc_data = bytes.fromhex((ROOT/'tests'/'fixtures'/'npc-stage7-fixture.hex').read_text().strip())
                                send(34, octets(npc_data))
                                if mode == 'select_finish_target':
                                    expected = packet(34, octets(struct.pack('<HQ', 10, 0x01000000000011f0)))
                                    got = tx_from_client.apply(exact(conn, len(expected)))
                                    assert got == expected, (got.hex(), expected.hex())
                                    send(34, octets(struct.pack('<Hqq', 204, roleid, 0x01000000000011f0)))
                                    send(34, octets(struct.pack('<H', 2223) + b'target-probe-reply'))
                            if mode == 'select_finish_error':
                                send(5, struct.pack('>i', 789) + octets(b'finish rejected'))
                        if mode == 'select_data':
                            send(34, octets(struct.pack('<H', 1234) + b'world-fixture'))
                elif mode == 'single':
                    send(83, page(roleid))
                elif mode == 'pagination':
                    send(83, page(roleid, cursor))
                    request(cursor)
                    send(83, page(roleid+1))
                elif mode == 'empty':
                    send(83, page(0))
                elif mode == 'malformed':
                    send(83, page(roleid) + b'\x00')
                elif mode == 'wrong_user':
                    send(83, page(roleid, uid=999))
                elif mode == 'repeated_cursor':
                    send(83, page(roleid, cursor))
                    request(cursor)
                    send(83, page(roleid, cursor))
                assert conn.recv(1) == b'', 'unexpected mutation or extra request'
        except Exception as e:
            errors.append(e)
        finally:
            listener.close()
    thread = threading.Thread(target=serve, daemon=True)
    thread.start()
    with tempfile.TemporaryDirectory() as tmp:
        cfg = Path(tmp) / 'test.conf'
        cfg.write_text('[Account]\nprefix=test\nstart=123\npassword=test-password\n', encoding='ascii')
        cmd = [JAVA, '-cp', str(CLASSES), 'XajhLoginProbe', '--host', '127.0.0.1', '--port', str(port), '--account', 'test123', '--config', str(cfg), '--timeout', '10']
        if mode.startswith('select_'):
            cmd += ['--role-id', str(roleid+1 if mode == 'select_missing' else roleid), '--observe-seconds', '1']
        if mode in ('select_finish', 'select_finish_timeout', 'select_finish_error', 'select_rejected_enter', 'select_finish_target', 'select_finish_target_missing'):
            cmd += ['--enter-world', '--world-log', str(Path(tmp)/'world.log')]
        if mode in ('select_finish_target', 'select_finish_target_missing'):
            cmd += ['--target-id', str(0x01000000000011f0 if mode == 'select_finish_target' else 999)]
        p = subprocess.run(cmd, capture_output=True, timeout=25)
        output = (p.stdout+p.stderr).decode('utf-8', errors='replace')
        code = 0 if mode in ('single', 'pagination', 'empty', 'select_data', 'select_timeout', 'select_finish', 'select_finish_timeout', 'select_finish_target') else 2 if mode == 'select_finish_error' else 1
        assert p.returncode == code, (mode, p.returncode, output, errors)
        assert 'test-password' not in output
        if mode == 'single':
            assert 'ROLE id=%d' % roleid in output
            assert 'level=45 profession=3 gender=0 status=1 zoneid=20586 equipment_count=1' in output
            assert r'name_escaped="\u6e2c\u8a66\u89d2\u8272"' in output
            assert 'ROLE_LIST_COMPLETE count=1 pages=1' in output
        if mode == 'pagination':
            assert 'ROLE_LIST_COMPLETE count=2 pages=2' in output
        if mode == 'empty':
            assert 'ROLE_LIST_COMPLETE count=0 pages=1' in output
        if mode == 'malformed':
            assert 'ROLE_LIST_PARSE_FAILED' in output
        if mode == 'wrong_user':
            assert 'userid mismatch' in output
        if mode == 'repeated_cursor':
            assert 'Repeated or excessive' in output
        if mode == 'select_data':
            assert 'SELECT_ROLE_OK roleid=%d' % roleid in output
            assert 'world_tid=1 scene_tag=2 x=10.5 y=20.25 z=-30.5 auth_length=10' in output
            assert 'GAME_DATA length=15 header_le16=1234' in output
            assert 'game_packets_after_select=1' in output
            assert 'auth-token' not in output
        if mode == 'select_timeout':
            assert 'OBSERVATION_TIMEOUT after_select=true' in output
            assert 'game_packets_after_select=0' in output
        if mode == 'select_missing':
            assert 'Requested role not found' in output
        if mode == 'select_rejected':
            assert 'SelectRole rejected result=27' in output
        if mode == 'select_wrong_user':
            assert 'SelectRole reply userid mismatch' in output
        if mode == 'select_finish':
            assert 'FINISH_LOADING_SENT type=72 roleid=%d islogin=0' % roleid in output
            assert 'game_packets_after_select=1' in output
            capture=(Path(tmp)/'world.log').read_text(encoding='ascii')
            assert 'header_le16=2222 payload_hex=' + (struct.pack('<H',2222)+bytes(range(256))*2).hex() in capture
            assert '3400a20800000000000000' in capture
            assert 'test-password' not in capture and 'auth-token' not in capture
        if mode == 'select_finish_timeout':
            assert 'FINISH_LOADING_SENT' in output and 'game_packets_after_select=0' in output
        if mode == 'select_rejected_enter':
            assert 'FINISH_LOADING_SENT' not in output
        if mode == 'select_finish_target':
            assert output.count('TARGET_SELECT_SENT') == 1
            assert 'server_echo_matched=true combat_success=unverified' in output
            assert 'NPC_SUMMARY observed_npcs=19' in output
            assert 'header_le16=2223' in output
            capture=(Path(tmp)/'world.log').read_text(encoding='ascii')
            assert 'TARGET_SELECT_SENT' in capture and 'target-probe-reply'.encode().hex() in capture
        if mode == 'select_finish_target_missing':
            assert 'TARGET_SELECT_SENT' not in output and 'Target not observed' in output
        if mode == 'select_finish_error':
            assert 'SERVER_ERROR code=789' in output
    thread.join(16)
    assert not thread.is_alive()
    if errors:
        raise errors[0]
    print('PASS:', mode)


if __name__ == '__main__':
    for name in ('single', 'pagination', 'empty', 'malformed', 'wrong_user', 'repeated_cursor', 'select_data', 'select_timeout', 'select_missing', 'select_rejected', 'select_wrong_user', 'select_finish', 'select_finish_timeout', 'select_finish_error', 'select_rejected_enter', 'select_finish_target', 'select_finish_target_missing'):
        case(name)
