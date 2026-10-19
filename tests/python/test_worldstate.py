"""Offline acceptance tests: real capture excerpts plus corrupt input cases."""
from pathlib import Path
import struct
import subprocess
import tempfile
from test_login_probe import JAVA, HERE, ROOT

SELF = bytes.fromhex('05006a70000000000000280301330700000000000038c300008b1703c34c7818428f055d4100c9010000000000dfeca8a2000000000000000000000000208000000008006a10000001ff0000000000')
MOVE = bytes.fromhex('1a00f011000000000001c56e02c3f6e20142fdd008c28000759800001a01')

def line(raw):
    return 'GAME_DATA length=%d header_le16=%d payload_hex=%s\n' % (len(raw), int.from_bytes(raw[:2], 'little'), raw.hex())

def run(text, role=28778, ok=True):
    with tempfile.TemporaryDirectory() as directory:
        capture = Path(directory) / 'capture.log'
        capture.write_text(text, encoding='ascii')
        p = subprocess.run([str(JAVA), '-jar', str(ROOT/'dist'/'xajh-login-probe.jar'),
                            '--host', 'invalid.invalid', '--role-id', str(role),
                            '--replay-world-log', str(capture)], capture_output=True, timeout=5)
        output = (p.stdout+p.stderr).decode('utf-8', errors='replace')
        assert (p.returncode == 0) == ok, output
        return output

def main():
    marker = 'FINISH_LOADING_SENT roleid=28778 islogin=0\n'
    output = run(line(SELF)+marker+line(SELF)+line(MOVE)+line(MOVE))
    assert 'skipped_before_loading=1' in output
    assert 'roleid=28778 level_candidate=40 profession_candidate=3' in output
    assert 'x=-131.09196 y=38.117477 z=13.813857' in output
    assert 'id=72057594037932528 id_hex=01000000000011f0' in output
    assert 'moving_objects=1' in output and 'updates=2 classification=unknown attackable=unknown' in output
    assert 'self_verified=true' in output
    run(marker+line(SELF), role=999, ok=False)
    run(line(SELF), ok=False)
    run(marker, ok=False)
    run(marker+line(SELF).replace('length=79', 'length=80'), ok=False)
    run(marker+line(SELF).replace('header_le16=5', 'header_le16=6'), ok=False)
    run(marker+'GAME_DATA length=79 header_le16=5 prefix_hex=0500\n', ok=False)
    for n in (2, 10, 24, 36, 78):
        run(marker+line(SELF[:n]), ok=False)
    bad = bytearray(SELF)
    bad[25:29] = struct.pack('<f', float('nan'))
    run(marker+line(bad), ok=False)
    output = run(marker+line(bytes.fromhex('ffff010203')))
    assert 'recognized_packets=0 self_verified=false' in output
    target_note = 'TARGET_SELECT_SENT targetid=72057594037932528 command=10 confirmation=unverified\n'
    echo = bytes.fromhex('cc006a70000000000000f011000000000001')
    output = run(marker+line(SELF)+target_note+line(echo))
    assert 'TARGET_STATE source_roleid=28778 targetid=72057594037932528 matches_requested=true' in output
    assert 'server_echo_matched=true combat_success=unverified' in output
    output = run(marker+line(SELF)+line(echo))
    assert 'server_echo_matched=false' in output
    output = run(marker+line(SELF)+target_note.replace('32528','32529')+line(echo))
    assert 'server_echo_matched=false' in output
    bad = bytearray(echo); struct.pack_into('<q', bad, 2, 999)
    output = run(marker+line(SELF)+target_note+line(bad))
    assert 'server_echo_matched=false' in output
    run(marker+line(echo[:-1]), ok=False)
    print('PASS: target echo identity/request correlation, unsolicited reply, wrong source/target and truncated target state')
    print('PASS: offline replay, real self/movement fixtures, exact 64-bit IDs, deduplication, unknown commands, mismatched role, corrupt/truncated capture, non-finite coordinate')

if __name__ == '__main__':
    main()
