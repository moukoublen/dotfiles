import colors from '@mui/material/node/colors/index.js';
import { formatMuiErrorMessage } from '@mui/utils';

const capitalizeFirstLetter = x => x.charAt(0).toUpperCase() + x.slice(1);
const compare = (r, l) => {
    if (r.color === l.color) {
        const rightAccent = Number(r.accent)
        const leftAccent = Number(l.accent)
        if (rightAccent < leftAccent) {
            return -1;
        }
        if (rightAccent > leftAccent) {
            return 1;
        }
        if (r.accent < l.accent) {
            return -1;
        }
        if (r.accent > l.accent) {
            return 1;
        }

        return 0;
    }

    return r.color.localeCompare(l.color);
};

console.log('#!/usr/bin/env bash');
console.log('');
console.log('# To generate this file run:');
console.log('#    npm run material --silent --prefix ./palettes > __colors-material.bash');
console.log('');
console.log('declare -A material');
console.log('');

Object.entries(colors).flatMap(([colorName, values]) =>
    Object.entries(values).map(([accent, value]) => {
        return {
            color: colorName,
            accent: accent,
            key: `${capitalizeFirstLetter(colorName)}-${accent}`,
            value: value.toUpperCase(),
        }
    })
)
.sort(compare)
.map((x) => `material['${x.key}']='${x.value}'`)
.forEach(x => console.log(x));


console.log('');
