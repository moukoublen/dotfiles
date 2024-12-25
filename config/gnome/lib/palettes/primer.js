import { createRequire } from 'module';
import { readFileSync } from 'fs';

const require = createRequire(import.meta.url);
const lightFilePath = require.resolve('@primer/primitives/dist/internalCss/light.css');
const darkFilePath = require.resolve('@primer/primitives/dist/internalCss/dark.css');
const darkDimmedFilePath = require.resolve('@primer/primitives/dist/internalCss/dark-dimmed.css');

const readBaseColorLines = (path) => {
    const scale = readFileSync(path, 'utf8')
        .split(/\r?\n/)
        .map(l => l.trim())
        .filter(l => l.startsWith("--base"))
        .map(l => l.slice("--".length))                 // remove "--" prefix
        .map(l => l.endsWith(";") ? l.slice(0, -1) : l) // remove ";" postfix
        .map(l => l.split(":"))
        .reduce(
            (acc, [key, value]) => {
                const v = value.trim()
                if (acc[key] && acc[key] !== v) {
                    throw new Error(`error for key: ${key} replace value mismatch: '${acc[key]}' and '${value}'`);
                }
                acc[key] = v;
                return acc
            },
            {}
        ) // reduce to object with color name as key and color hex as value

    const retrieve = (value) => {
        if (typeof value === "string" && value.startsWith("var(")) { // e.g. var(--base-color-white)
            const v = value.slice("var(--".length).slice(0, -1)
            return retrieve(scale[v])
        }
        return value
    }

    for (const key in scale) {
        scale[key] = retrieve(scale[key]);
    }

    return scale
}

// read all in-mem
const light = readBaseColorLines(lightFilePath);
const dark = readBaseColorLines(darkFilePath);
const darkDimmed = readBaseColorLines(darkDimmedFilePath);

// console.log(light);
// process.exit(0)

console.log('#!/usr/bin/env bash');
console.log('');
console.log('# To generate this file run:');
console.log('#    npm run primer --silent --prefix ./palettes > __colors-primer.bash');
console.log('#');
console.log('# https://primer.style/primitives/storybook/?path=/story/color-base-display-scales--all-scales');
console.log('# https://primer.style/primitives/storybook/?path=/story/color-base-scales--all-scales');
console.log('');
console.log('declare -A primer_dark_dimmed');
console.log('declare -A primer_dark');
console.log('declare -A primer_light');
console.log('');

const bashTable = (name) => (key, val) => `${name}['${key}']='${val.toLowerCase()}'`;

[
    [light, 'primer_light'],
    [dark, 'primer_dark'],
    [darkDimmed, 'primer_dark_dimmed'],
]
    .map(([palette, bashName]) => [palette, bashTable(bashName)])
    .flatMap(([scale, format]) =>
        Object.entries(scale).flatMap(([colorName, colorValue]) => format(colorName, colorValue))
    )
    .forEach(x => console.log(x));

console.log('');
console.log('export primer_dark_dimmed');
console.log('export primer_dark');
console.log('export primer_light');
