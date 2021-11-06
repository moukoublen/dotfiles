#!/usr/bin/env bash

## Primer Light Mode
source __colors-primer.bash

export C_FG=${primer_light['black']}
export C_BG=${primer_light['gray-2']}
export C_HFG=${primer_light['gray-0']}
export C_HBG=${primer_light['pink-5']}
export C_CFG=${primer_light['gray-0']}
export C_CBG=${primer_light['pink-5']}

export C_00=${primer_light['gray-8']}   # Black
export C_08=${primer_light['gray-7']}   # Light Black
export C_07=${primer_light['gray-5']}   # Grey
export C_15=${primer_light['gray-4']}   # Light Grey

export C_01=${primer_light['red-8']}    # Red
export C_09=${primer_light['red-6']}    # Light Red
export C_02=${primer_light['green-8']}  # Green
export C_10=${primer_light['green-6']}  # Light Green
export C_03=${primer_light['yellow-8']} # Yellow
export C_11=${primer_light['yellow-6']} # Light Yellow
export C_04=${primer_light['blue-8']}   # Blue
export C_12=${primer_light['blue-6']}   # Light Blue
export C_05=${primer_light['purple-8']} # Purple
export C_13=${primer_light['purple-6']} # Light Purple
export C_06=${primer_light['pink-8']}   # Turquoise
export C_14=${primer_light['pink-6']}   # Light Turquoise


export C_PAL="['${C_00}','${C_01}','${C_02}','${C_03}','${C_04}','${C_05}','${C_06}','${C_07}','${C_08}','${C_09}','${C_10}','${C_11}','${C_12}','${C_13}','${C_14}','${C_15}']"
