import piLens from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-lens/dist/index.js";
import piReadseek from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-readseek/dist/index.js";
import piShazam from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-shazam/dist/index.js";
import piWebAccess from "/data/data/com.termux/files/home/.pi/agent/npm/node_modules/pi-web-access/index.ts";

export default function piSearchSuite(pi: any) {
  if (typeof piLens === "function") piLens(pi);
  else if (piLens && typeof (piLens as any).default === "function") (piLens as any).default(pi);

  if (typeof piReadseek === "function") piReadseek(pi);
  else if (piReadseek && typeof (piReadseek as any).default === "function") (piReadseek as any).default(pi);

  if (typeof piShazam === "function") piShazam(pi);
  else if (piShazam && typeof (piShazam as any).default === "function") (piShazam as any).default(pi);

  if (typeof piWebAccess === "function") piWebAccess(pi);
  else if (piWebAccess && typeof (piWebAccess as any).default === "function") (piWebAccess as any).default(pi);
}
