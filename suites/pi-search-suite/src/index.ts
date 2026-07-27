import * as piLens from "../../../vendor/pi-lens/dist/index.js";
import * as piReadseek from "../../../vendor/readseek/packages/pi-readseek/dist/index.js";
import * as piShazam from "../../../vendor/pi-shazam/dist/index.js";
import * as piWebAccess from "../../../vendor/pi-web-access/index.ts";

function call(mod: unknown, pi: unknown) {
  const fn = (mod as any)?.default ?? mod;
  if (typeof fn === "function") fn(pi);
}

export default function piSearchSuite(pi: any) {
  call(piLens, pi);
  call(piReadseek, pi);
  call(piShazam, pi);
  call(piWebAccess, pi);
}
