import fs from 'node:fs';
import path from 'node:path';
import YAML from 'yaml';

const base = 'node_modules/@primer/primitives/dist/internalCss';

const lightCSS = fs.readFileSync(path.join(base, `light.css`), 'utf8');
const darkCSS = fs.readFileSync(path.join(base, `dark.css`), 'utf8');
const darkDimmedCSS = fs.readFileSync(path.join(base, `dark-dimmed.css`), 'utf8');

const baseColorRegex = /--base-(display-)?color-([\w-]+):\s*([^;]+);/g;

function parseBaseColors(css) {
  const baseColors = Object.fromEntries(
    Array.from(css.matchAll(baseColorRegex), ([, display, name, value]) => [
      `base-${display ?? ''}color-${name}`,
      value.trim(),
    ]),
  );
  const resolveHex = (value, seen = new Set()) => {
    const reference = value?.match(/^var\(--([\w-]+)\)$/);
    if (!reference) return value;
    const name = reference[1];
    if (seen.has(name)) return undefined;
    seen.add(name);
    return resolveHex(baseColors[name], seen);
  };

  return Object.fromEntries(
    Object.entries(baseColors).map(([name, value]) => [name, resolveHex(value)]),
  );
}

function parseAnsiColors(css, baseColors) {
  const ansiColorRegex = /--(ansi-[\w-]+):[\t ]*([^;\r\n]+;[\t ]*(?:\/\*[^]*?\*\/)?)/g;

  return Object.fromEntries(
    Array.from(css.matchAll(ansiColorRegex), ([, name, original]) => {
      const value = original.slice(0, original.indexOf(';')).trim();
      const reference = value.match(/^var\(--([\w-]+)\)$/);
      const hex = reference ? baseColors[reference[1]] : value;

      if (!/^#[0-9a-fA-F]{3,8}$/.test(hex ?? '')) {
        throw new Error(`Unable to resolve ANSI color ${name}: ${value}`);
      }

      return [name, { original: original.trimEnd(), hex }];
    }),
  );
}

const lightBasesColors = parseBaseColors(lightCSS)
const darkBaseColors = parseBaseColors(darkCSS)
const darkDimmedBaseColors = parseBaseColors(darkDimmedCSS)

const colors = {
  'light': {
    'base': lightBasesColors,
    'ansi': parseAnsiColors(lightCSS, lightBasesColors),
  },
  'dark': {
    'base': darkBaseColors,
    'ansi': parseAnsiColors(darkCSS, darkBaseColors),
  },
  'dark-dimmed': {
    'base': darkDimmedBaseColors,
    'ansi': parseAnsiColors(darkDimmedCSS, darkDimmedBaseColors),
  },
};

fs.writeFileSync('primer.yaml', YAML.stringify(colors));
fs.writeFileSync('primer.json', JSON.stringify(colors));
