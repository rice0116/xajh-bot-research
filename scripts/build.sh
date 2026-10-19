#!/usr/bin/env sh
set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CLASSES="$PROJECT_ROOT/build/classes"
JAR="$PROJECT_ROOT/dist/xajh-login-probe.jar"

rm -rf "$CLASSES"
mkdir -p "$CLASSES" "$PROJECT_ROOT/dist"
javac -source 1.6 -target 1.6 -encoding UTF-8 -d "$CLASSES" \
  "$PROJECT_ROOT/src/main/java/XajhLoginProbe.java"
jar cfe "$JAR" XajhLoginProbe -C "$CLASSES" .
echo "Built $JAR"
