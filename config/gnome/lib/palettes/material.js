import { HCT } from "@material/material-color-utilities";

// Simple demonstration of HCT.
const color = HCT.fromInt(0xff4285f4);
console.log(`Hue: ${color.hue}`);
console.log(`Chrome: ${color.chroma}`);
console.log(`Tone: ${color.tone}`);
