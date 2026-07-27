#!/data/data/com.termux/files/usr/bin/sh
set -eu

PREFIX_BIN="${PREFIX}/bin"
LIB="${PREFIX}/lib/libfff_c.so"
NPM_ROOT="${HOME}/.pi/agent/npm"

printf '%s\n' '== Pi Suites Termux E2E =='
command -v ast-grep >/dev/null
command -v readseek >/dev/null
[ -f "$LIB" ]

ast-grep --version
readseek --version
file "$LIB"
case "$(file -b "$LIB")" in *ARM*aarch64*|*ARM*64*) ;; *) echo 'libfff_c.so is not ARM64' >&2; exit 1 ;; esac

for pkg in pi-search-suite pi-memory-suite pi-execution-suite; do
  tgz="$NPM_ROOT/$pkg-1.0.0.tgz"
  [ -f "$tgz" ] || { echo "missing $tgz" >&2; exit 1; }
  npm install --global --prefix "$NPM_ROOT" "$tgz" >/dev/null
  node -e "const p=require('$pkg/package.json'); const f=require('$pkg/'+p.main); if(typeof f!=='function') throw Error('$pkg factory missing'); console.log('ok $pkg factory')"
done

printf '%s\n' 'Starting Pi extension load check; exit Pi after startup with Ctrl-C.'
exec pi --no-session
