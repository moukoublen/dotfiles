#!/usr/bin/env bash

## Primer Dark_dimmed Mode
source __colors-primer.bash

export C_FG=${primer_dark_dimmed['gray-1']}
export C_BG=${primer_dark_dimmed['gray-9']}
export C_HFG=${primer_dark_dimmed['gray-0']}
export C_HBG=${primer_dark_dimmed['pink-8']}

export C_00=${primer_dark_dimmed['gray-6']}   # Black
export C_08=${primer_dark_dimmed['gray-4']}   # Light Black
export C_07=${primer_dark_dimmed['gray-2']}   # Grey
export C_15=${primer_dark_dimmed['gray-0']}   # Light Grey

export C_01=${primer_dark_dimmed['red-4']}    # Red
export C_09=${primer_dark_dimmed['red-3']}    # Light Red
export C_02=${primer_dark_dimmed['green-4']}  # Green
export C_10=${primer_dark_dimmed['green-3']}  # Light Green
export C_03=${primer_dark_dimmed['yellow-4']} # Yellow
export C_11=${primer_dark_dimmed['yellow-3']} # Light Yellow
export C_04=${primer_dark_dimmed['blue-4']}   # Blue
export C_12=${primer_dark_dimmed['blue-3']}   # Light Blue
export C_05=${primer_dark_dimmed['purple-4']} # Purple
export C_13=${primer_dark_dimmed['purple-3']} # Light Purple
export C_06=${primer_dark_dimmed['pink-4']}   # Turquoise
export C_14=${primer_dark_dimmed['pink-3']}   # Light Turquoise


export C_PAL="['${C_00}','${C_01}','${C_02}','${C_03}','${C_04}','${C_05}','${C_06}','${C_07}','${C_08}','${C_09}','${C_10}','${C_11}','${C_12}','${C_13}','${C_14}','${C_15}']"
