#!/data/data/com.termux/files/usr/bin/sh
set -e

TMP_DIR="$(mktemp -d "${TMPDIR:-${PREFIX}/tmp}"/pi-suites-all.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "=== Installing Full Pi Suites Monorepo + CLI Binaries for Termux ==="

RELEASE_URL="https://github.com/sasazemzulin058-debug/pi-suites/releases/download/nightly"
AGENT_NPM="${HOME}/.pi/agent/npm"
BIN_DIR="${PREFIX}/bin"

# 1. Install Native CLI Binaries
echo "--> Installing ast-grep CLI binary..."
curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/ast-grep" "https://github.com/sasazemzulin058-debug/ast-grep/releases/download/v0.45.0-android.1/ast-grep-aarch64-linux-android" || true
if [ -f "$TMP_DIR/ast-grep" ]; then
  cp "$TMP_DIR/ast-grep" "$BIN_DIR/ast-grep"
  chmod 755 "$BIN_DIR/ast-grep"
fi

echo "--> Installing readseek CLI binary..."
curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/readseek" "https://github.com/sasazemzulin058-debug/readseek/releases/download/v0.8.12-android.1/readseek-aarch64-linux-android" || true
if [ -f "$TMP_DIR/readseek" ]; then
  cp "$TMP_DIR/readseek" "$BIN_DIR/readseek"
  chmod 755 "$BIN_DIR/readseek"
fi

echo "--> Installing libfff_c.so native library..."
curl -L --retry 3 --connect-timeout 10 -o "$TMP_DIR/libfff_c.so" "https://github.com/sasazemzulin058-debug/fff/releases/download/nightly/c-lib-aarch64-linux-android.so" || true
if [ -f "$TMP_DIR/libfff_c.so" ]; then
  cp "$TMP_DIR/libfff_c.so" "${PREFIX}/lib/libfff_c.so"
  chmod 755 "${PREFIX}/lib/libfff_c.so"
fi

# 2. Install Precompiled Suites JS Bundles
mkdir -p "$AGENT_NPM/node_modules/pi-search-suite/dist"
mkdir -p "$AGENT_NPM/node_modules/pi-memory-suite/dist"
mkdir -p "$AGENT_NPM/node_modules/pi-execution-suite/dist"

echo "--> Installing pi-search-suite precompiled bundle..."
curl -L --retry 3 --connect-timeout 10 -o "$AGENT_NPM/node_modules/pi-search-suite/dist/index.js" "$RELEASE_URL/pi-search-suite-index.js" || true

echo "--> Installing pi-memory-suite precompiled bundle..."
curl -L --retry 3 --connect-timeout 10 -o "$AGENT_NPM/node_modules/pi-memory-suite/dist/index.js" "$RELEASE_URL/pi-memory-suite-index.js" || true

echo "--> Installing pi-execution-suite precompiled bundle..."
curl -L --retry 3 --connect-timeout 10 -o "$AGENT_NPM/node_modules/pi-execution-suite/dist/index.js" "$RELEASE_URL/pi-execution-suite-index.js" || true

echo "✅ Full Pi Suites & CLI binaries installed successfully!"
