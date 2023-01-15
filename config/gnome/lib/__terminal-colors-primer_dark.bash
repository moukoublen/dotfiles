#!/usr/bin/env bash

## Primer Dark Mode
source __colors-primer.bash

export C_FG=${primer_dark['gray-2']}
export C_BG=${primer_dark['gray-9']}
export C_HFG=${primer_dark['white']}
export C_HBG=${primer_dark['pink-7']}
export C_CFG=${primer_dark['purple-8']}
export C_CBG=${primer_light['pink-5']}

export C_00=${primer_dark['gray-5']}   # Black
export C_08=${primer_dark['gray-4']}   # Light Black
export C_07=${primer_dark['gray-0']}   # Grey
export C_15=${primer_dark['white']}    # Light Grey

export C_01=${primer_dark['red-5']}    # Red
export C_09=${primer_dark['red-4']}    # Light Red
export C_02=${primer_dark['green-5']}  # Green
export C_10=${primer_dark['green-4']}  # Light Green
export C_03=${primer_dark['yellow-5']} # Yellow
export C_11=${primer_dark['yellow-4']} # Light Yellow
export C_04=${primer_dark['blue-5']}   # Blue
export C_12=${primer_dark['blue-4']}   # Light Blue
export C_05=${primer_dark['purple-5']} # Purple
export C_13=${primer_dark['purple-4']} # Light Purple
export C_06=${primer_dark['pink-5']}   # Turquoise
export C_14=${primer_dark['pink-4']}   # Light Turquoise


export C_PAL="['${C_00}','${C_01}','${C_02}','${C_03}','${C_04}','${C_05}','${C_06}','${C_07}','${C_08}','${C_09}','${C_10}','${C_11}','${C_12}','${C_13}','${C_14}','${C_15}']"
