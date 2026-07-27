import * as piWorkflows from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/@quintinshaw/pi-dynamic-workflows/dist/index.js";
import piSubagents from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-subagents/index.ts";
import piProcesses from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/@aliou/pi-processes/src/index.ts";
import piSchedule from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-schedule-prompt/dist/index.js";
import piLoopPolice from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-loop-police/extensions/loop-police.ts";

export default function piExecutionSuite(pi: any) {
  const workflowsFn = (piWorkflows as any).default || piWorkflows;
  if (typeof workflowsFn === "function") workflowsFn(pi);

  if (typeof piSubagents === "function") piSubagents(pi);
  else if (piSubagents && typeof (piSubagents as any).default === "function") (piSubagents as any).default(pi);

  if (typeof piProcesses === "function") piProcesses(pi);
  else if (piProcesses && typeof (piProcesses as any).default === "function") (piProcesses as any).default(pi);

  if (typeof piSchedule === "function") piSchedule(pi);
  else if (piSchedule && typeof (piSchedule as any).default === "function") (piSchedule as any).default(pi);

  if (typeof piLoopPolice === "function") piLoopPolice(pi);
  else if (piLoopPolice && typeof (piLoopPolice as any).default === "function") (piLoopPolice as any).default(pi);
}
