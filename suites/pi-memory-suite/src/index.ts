import piHermesMemory from "../../../vendor/pi-hermes-memory/src/index.ts";
import contextMode from "../../../vendor/context-mode/build/adapters/pi/extension.js";

export default function piMemorySuite(pi: any) {
  if (typeof piHermesMemory === "function") piHermesMemory(pi);
  else if (piHermesMemory && typeof (piHermesMemory as any).default === "function") (piHermesMemory as any).default(pi);

  if (typeof contextMode === "function") contextMode(pi);
  else if (contextMode && typeof (contextMode as any).default === "function") (contextMode as any).default(pi);
}
