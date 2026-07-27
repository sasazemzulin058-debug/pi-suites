#!/data/data/com.termux/files/usr/bin/sh
set -e

TMP_DIR="$(mktemp -d "${TMPDIR:-${PREFIX}/tmp}"/pi-suites-all.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "=== Installing Full Pi Suites Monorepo + CLI Binaries for Termux ==="

AGENT_NPM="${HOME}/.pi/agent/npm"
BIN_DIR="${PREFIX}/bin"

# 1. Install Native CLI Binaries
RELEASE_URL="https://github.com/sasazemulin058-debug/pi-suites/releases/download/nightly"

download_asset() {
  asset="$1"
  out="$2"
  curl -fL --retry 3 --connect-timeout 10 "$RELEASE_URL/$asset?download=1" -o "$out"
}

echo "--> Installing ast-grep CLI binary..."
download_asset ast-grep-android-arm64 "$TMP_DIR/ast-grep"
install -m 755 "$TMP_DIR/ast-grep" "$BIN_DIR/ast-grep"

 echo "--> Installing readseek CLI binary..."
download_asset readseek-android-arm64 "$TMP_DIR/readseek"
install -m 755 "$TMP_DIR/readseek" "$BIN_DIR/readseek"

 echo "--> Installing libfff_c.so native library..."
download_asset libfff_c.so "$TMP_DIR/libfff_c.so"
install -m 755 "$TMP_DIR/libfff_c.so" "${PREFIX}/lib/libfff_c.so"

mkdir -p "$AGENT_NPM/node_modules/@earendil-works"
PI_GLOBAL="${PREFIX}/lib/node_modules/@earendil-works/pi-coding-agent/node_modules/@earendil-works"
for runtime in pi-ai pi-coding-agent pi-tui; do
  if [ -e "$PI_GLOBAL/$runtime" ]; then
    ln -sfn "$PI_GLOBAL/$runtime" "$AGENT_NPM/node_modules/@earendil-works/$runtime"
  fi
done
for pkg in pi-search-suite pi-memory-suite pi-execution-suite; do
  echo "--> Installing $pkg..."
  download_asset "$pkg-1.0.0.tgz" "$TMP_DIR/$pkg.tgz"
  mkdir -p "$AGENT_NPM/node_modules/$pkg"
  tar -xzf "$TMP_DIR/$pkg.tgz" -C "$AGENT_NPM/node_modules/$pkg" --strip-components=1
 done

echo "✅ Pi suites, CLI binaries, and native library installed successfully!"
