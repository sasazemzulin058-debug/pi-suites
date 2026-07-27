import * as piWorkflows from "../../../vendor/pi-dynamic-workflows/dist/index.js";
import * as piSubagents from "../../../vendor/pi-subagents/index.ts";
import * as piProcesses from "../../../vendor/pi-processes/src/index.ts";
import * as piSchedule from "../../../vendor/pi-schedule-prompt/dist/index.js";
import * as piLoopPolice from "../../../vendor/pi-loop-police/extensions/loop-police.ts";

function call(mod: unknown, pi: unknown) {
  const fn = (mod as any)?.default ?? mod;
  if (typeof fn === "function") fn(pi);
}

export default function piExecutionSuite(pi: any) {
  call(piWorkflows, pi);
  call(piSubagents, pi);
  call(piProcesses, pi);
  call(piSchedule, pi);
  call(piLoopPolice, pi);
}
