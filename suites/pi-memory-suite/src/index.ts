import piHermesMemory from "/data/data/com.termux/files/home/workspace/pi-hermes-memory/src/index.ts";
import contextMode from "/data/data/com.termux/files/home/workspace/context-mode-termux/build/adapters/pi/extension.js";

export default function piMemorySuite(pi: any) {
  if (typeof piHermesMemory === "function") piHermesMemory(pi);
  else if (piHermesMemory && typeof (piHermesMemory as any).default === "function") (piHermesMemory as any).default(pi);

  if (typeof contextMode === "function") contextMode(pi);
  else if (contextMode && typeof (contextMode as any).default === "function") (contextMode as any).default(pi);
}
