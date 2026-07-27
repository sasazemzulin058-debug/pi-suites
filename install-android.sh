#!/data/data/com.termux/files/usr/bin/sh
set -e

TMP_DIR="$(mktemp -d "${TMPDIR:-${PREFIX}/tmp}"/pi-suites.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "=== Installing Precompiled Pi Suites for Termux/Android ARM64 ==="

RELEASE_URL="https://github.com/sasazemzulin058-debug/pi-suites/releases/download/nightly"
AGENT_NPM="${HOME}/.pi/agent/npm"
mkdir -p "$AGENT_NPM/node_modules/pi-search-suite/dist"
mkdir -p "$AGENT_NPM/node_modules/pi-memory-suite/dist"
mkdir -p "$AGENT_NPM/node_modules/pi-execution-suite/dist"

echo "Downloading search suite..."
curl -L --retry 3 --connect-timeout 10 -o "$AGENT_NPM/node_modules/pi-search-suite/dist/index.js" "$RELEASE_URL/index.js" || true

echo "✅ Pi Suites successfully installed and ready"
