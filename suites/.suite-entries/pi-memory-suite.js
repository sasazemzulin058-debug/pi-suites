'use strict';
function tryLoad(rel, name) {
  try {
    const m = require(require.resolve(rel, { paths: [__dirname] }));
    const fn = m && m.default !== undefined ? m.default : m;
    if (typeof fn === 'function') return fn;
  } catch (e) {
    process.stderr.write('[pi-memory-suite] skip ' + name + ': ' + e.message + '\n');
  }
  return null;
}
module.exports = function piMemorySuite(pi) {
  var targets = [
    ['./pi-hermes-memory.js', 'pi-hermes-memory'],
  ];
  for (var i = 0; i < targets.length; i++) {
    var fn = tryLoad(targets[i][0], targets[i][1]);
    if (fn) fn(pi);
  }
};
