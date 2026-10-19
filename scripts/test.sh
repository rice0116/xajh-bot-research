#!/usr/bin/env sh
set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
"$PROJECT_ROOT/scripts/build.sh"
java -jar "$PROJECT_ROOT/dist/xajh-login-probe.jar" --self-test
python3 "$PROJECT_ROOT/tests/python/test_login_probe.py" java
python3 "$PROJECT_ROOT/tests/python/test_rolelist.py" java
python3 "$PROJECT_ROOT/tests/python/test_worldstate.py" java
echo 'All tests passed.'
