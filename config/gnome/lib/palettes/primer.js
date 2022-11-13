import * as primer from "@primer/primitives";

const colors = primer.default.default.colors

console.log('#!/usr/bin/env bash');
console.log('');
console.log('# To generate this file run:');
console.log('#    npm run primer --silent --prefix ./palettes > __colors-primer.bash');
console.log('');
console.log('declare -A primer_dark_dimmed');
console.log('declare -A primer_dark');
console.log('declare -A primer_light');
console.log('');


const bashTable = (name) => (key, val) => `${name}['${key}']='${val}'`;

[
    [colors.light, 'primer_light'],
    [colors.dark, 'primer_dark'],
    [colors.dark_dimmed, 'primer_dark_dimmed'],
]
.map(([palette, bashName]) => [palette.scale, bashTable(bashName)])
.flatMap(([scale, format]) =>
    Object.entries(scale).flatMap(([key, value]) =>
        Array.isArray(value)
            ? value.map((color, idx) => format(`${key}-${idx}`, color))
            : [format(key, value)]
    )
)
.forEach(x => console.log(x));

console.log('');
console.log('export primer_dark_dimmed');
console.log('export primer_dark');
console.log('export primer_light');
