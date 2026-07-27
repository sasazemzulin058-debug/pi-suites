#!/data/data/com.termux/files/usr/bin/sh
set -e

TMP_DIR="$(mktemp -d "${TMPDIR:-${PREFIX}/tmp}"/pi-cli.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "=== Installing CLI Native Binaries (ast-grep, readseek, fff) ==="
BIN_DIR="${PREFIX}/bin"

curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/ast-grep" "https://github.com/sasazemzulin058-debug/ast-grep/releases/download/v0.45.0-android.1/ast-grep-aarch64-linux-android"
cp "$TMP_DIR/ast-grep" "$BIN_DIR/ast-grep"
chmod 755 "$BIN_DIR/ast-grep"

curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/readseek" "https://github.com/sasazemzulin058-debug/readseek/releases/download/v0.8.12-android.1/readseek-aarch64-linux-android"
cp "$TMP_DIR/readseek" "$BIN_DIR/readseek"
chmod 755 "$BIN_DIR/readseek"

curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/libfff_c.so" "https://github.com/sasazemzulin058-debug/fff/releases/download/nightly/c-lib-aarch64-linux-android.so"
cp "$TMP_DIR/libfff_c.so" "${PREFIX}/lib/libfff_c.so"
chmod 755 "${PREFIX}/lib/libfff_c.so"

echo "✅ CLI binaries successfully installed to $BIN_DIR"
