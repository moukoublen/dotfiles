#!/usr/bin/env bash

# shellcheck disable=SC1091,SC2154

## Primer Dark Mode
SRC_PATH=
SRC_PATH="$(dirname "$(realpath "${0}")")"
source "${SRC_PATH}/__colors-primer.bash"

export C_FG=${primer_dark['base-color-white']}
export C_BG=${primer_dark['base-color-black']}
export C_HFG=${primer_dark['base-color-neutral-11']}
export C_HBG=${primer_dark['base-color-pink-7']}
export C_CFG=${primer_dark['base-color-purple-8']}
export C_CBG=${primer_light['base-color-pink-3']}

export C_00=${primer_dark['base-color-neutral-6']} # Black
export C_08=${primer_dark['base-color-neutral-7']} # Light Black
export C_07=${primer_dark['base-color-neutral-8']} # Grey
export C_15=${primer_dark['base-color-neutral-9']} # Light Grey

export C_01=${primer_dark['base-color-red-5']}    # Red
export C_09=${primer_dark['base-color-red-3']}    # Light Red
export C_02=${primer_dark['base-color-green-5']}  # Green
export C_10=${primer_dark['base-color-green-3']}  # Light Green
export C_03=${primer_dark['base-color-yellow-5']} # Yellow
export C_11=${primer_dark['base-color-yellow-3']} # Light Yellow
export C_04=${primer_dark['base-color-blue-5']}   # Blue
export C_12=${primer_dark['base-color-blue-3']}   # Light Blue
export C_05=${primer_dark['base-color-purple-5']} # Purple
export C_13=${primer_dark['base-color-purple-3']} # Light Purple
export C_06=${primer_dark['base-color-pink-5']}   # Turquoise
export C_14=${primer_dark['base-color-pink-3']}   # Light Turquoise

export C_PAL="['${C_00}','${C_01}','${C_02}','${C_03}','${C_04}','${C_05}','${C_06}','${C_07}','${C_08}','${C_09}','${C_10}','${C_11}','${C_12}','${C_13}','${C_14}','${C_15}']"
