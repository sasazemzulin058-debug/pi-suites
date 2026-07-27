'use strict';
function tryLoad(rel, name) {
  try {
    const m = require(require.resolve(rel, { paths: [__dirname] }));
    const fn = m && m.default !== undefined ? m.default : m;
    if (typeof fn === 'function') return fn;
  } catch (e) {
    process.stderr.write('[pi-execution-suite] skip ' + name + ': ' + e.message + '\n');
  }
  return null;
}
module.exports = function piExecutionSuite(pi) {
  var targets = [
    ['./pi-dynamic-workflows.js', 'pi-dynamic-workflows'],
    ['./pi-subagents.js', 'pi-subagents'],
    ['./pi-processes.js', 'pi-processes'],
    ['./pi-schedule-prompt.js', 'pi-schedule-prompt'],
    ['./pi-loop-police.js', 'pi-loop-police'],
  ];
  for (var i = 0; i < targets.length; i++) {
    var fn = tryLoad(targets[i][0], targets[i][1]);
    if (fn) fn(pi);
  }
};