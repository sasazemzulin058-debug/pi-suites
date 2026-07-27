import * as piHermesMemory from "../../../vendor/pi-hermes-memory/src/index.ts";
import * as contextMode from "../../../vendor/context-mode/build/adapters/pi/extension.js";

function call(mod: unknown, pi: unknown) {
  const fn = (mod as any)?.default ?? mod;
  if (typeof fn === "function") fn(pi);
}

export default function piMemorySuite(pi: any) {
  call(piHermesMemory, pi);
  call(contextMode, pi);
}
