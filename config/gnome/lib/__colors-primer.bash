#!/usr/bin/env bash

# To generate this file run:
#    npm run primer --silent --prefix ./palettes > __colors-primer.bash

declare -A primer_dark_dimmed
declare -A primer_dark
declare -A primer_light

primer_light['black']='#1F2328'
primer_light['white']='#ffffff'
primer_light['gray-0']='#f6f8fa'
primer_light['gray-1']='#eaeef2'
primer_light['gray-2']='#d0d7de'
primer_light['gray-3']='#afb8c1'
primer_light['gray-4']='#8c959f'
primer_light['gray-5']='#6e7781'
primer_light['gray-6']='#57606a'
primer_light['gray-7']='#424a53'
primer_light['gray-8']='#32383f'
primer_light['gray-9']='#24292f'
primer_light['blue-0']='#ddf4ff'
primer_light['blue-1']='#b6e3ff'
primer_light['blue-2']='#80ccff'
primer_light['blue-3']='#54aeff'
primer_light['blue-4']='#218bff'
primer_light['blue-5']='#0969da'
primer_light['blue-6']='#0550ae'
primer_light['blue-7']='#033d8b'
primer_light['blue-8']='#0a3069'
primer_light['blue-9']='#002155'
primer_light['green-0']='#dafbe1'
primer_light['green-1']='#aceebb'
primer_light['green-2']='#6fdd8b'
primer_light['green-3']='#4ac26b'
primer_light['green-4']='#2da44e'
primer_light['green-5']='#1a7f37'
primer_light['green-6']='#116329'
primer_light['green-7']='#044f1e'
primer_light['green-8']='#003d16'
primer_light['green-9']='#002d11'
primer_light['yellow-0']='#fff8c5'
primer_light['yellow-1']='#fae17d'
primer_light['yellow-2']='#eac54f'
primer_light['yellow-3']='#d4a72c'
primer_light['yellow-4']='#bf8700'
primer_light['yellow-5']='#9a6700'
primer_light['yellow-6']='#7d4e00'
primer_light['yellow-7']='#633c01'
primer_light['yellow-8']='#4d2d00'
primer_light['yellow-9']='#3b2300'
primer_light['orange-0']='#fff1e5'
primer_light['orange-1']='#ffd8b5'
primer_light['orange-2']='#ffb77c'
primer_light['orange-3']='#fb8f44'
primer_light['orange-4']='#e16f24'
primer_light['orange-5']='#bc4c00'
primer_light['orange-6']='#953800'
primer_light['orange-7']='#762c00'
primer_light['orange-8']='#5c2200'
primer_light['orange-9']='#471700'
primer_light['red-0']='#ffebe9'
primer_light['red-1']='#ffcecb'
primer_light['red-2']='#ffaba8'
primer_light['red-3']='#ff8182'
primer_light['red-4']='#fa4549'
primer_light['red-5']='#cf222e'
primer_light['red-6']='#a40e26'
primer_light['red-7']='#82071e'
primer_light['red-8']='#660018'
primer_light['red-9']='#4c0014'
primer_light['purple-0']='#fbefff'
primer_light['purple-1']='#ecd8ff'
primer_light['purple-2']='#d8b9ff'
primer_light['purple-3']='#c297ff'
primer_light['purple-4']='#a475f9'
primer_light['purple-5']='#8250df'
primer_light['purple-6']='#6639ba'
primer_light['purple-7']='#512a97'
primer_light['purple-8']='#3e1f79'
primer_light['purple-9']='#2e1461'
primer_light['pink-0']='#ffeff7'
primer_light['pink-1']='#ffd3eb'
primer_light['pink-2']='#ffadda'
primer_light['pink-3']='#ff80c8'
primer_light['pink-4']='#e85aad'
primer_light['pink-5']='#bf3989'
primer_light['pink-6']='#99286e'
primer_light['pink-7']='#772057'
primer_light['pink-8']='#611347'
primer_light['pink-9']='#4d0336'
primer_light['coral-0']='#fff0eb'
primer_light['coral-1']='#ffd6cc'
primer_light['coral-2']='#ffb4a1'
primer_light['coral-3']='#fd8c73'
primer_light['coral-4']='#ec6547'
primer_light['coral-5']='#c4432b'
primer_light['coral-6']='#9e2f1c'
primer_light['coral-7']='#801f0f'
primer_light['coral-8']='#691105'
primer_light['coral-9']='#510901'
primer_dark['black']='#010409'
primer_dark['white']='#ffffff'
primer_dark['gray-0']='#f0f6fc'
primer_dark['gray-1']='#c9d1d9'
primer_dark['gray-2']='#b1bac4'
primer_dark['gray-3']='#8b949e'
primer_dark['gray-4']='#6e7681'
primer_dark['gray-5']='#484f58'
primer_dark['gray-6']='#30363d'
primer_dark['gray-7']='#21262d'
primer_dark['gray-8']='#161b22'
primer_dark['gray-9']='#0d1117'
primer_dark['blue-0']='#cae8ff'
primer_dark['blue-1']='#a5d6ff'
primer_dark['blue-2']='#79c0ff'
primer_dark['blue-3']='#58a6ff'
primer_dark['blue-4']='#388bfd'
primer_dark['blue-5']='#1f6feb'
primer_dark['blue-6']='#1158c7'
primer_dark['blue-7']='#0d419d'
primer_dark['blue-8']='#0c2d6b'
primer_dark['blue-9']='#051d4d'
primer_dark['green-0']='#aff5b4'
primer_dark['green-1']='#7ee787'
primer_dark['green-2']='#56d364'
primer_dark['green-3']='#3fb950'
primer_dark['green-4']='#2ea043'
primer_dark['green-5']='#238636'
primer_dark['green-6']='#196c2e'
primer_dark['green-7']='#0f5323'
primer_dark['green-8']='#033a16'
primer_dark['green-9']='#04260f'
primer_dark['yellow-0']='#f8e3a1'
primer_dark['yellow-1']='#f2cc60'
primer_dark['yellow-2']='#e3b341'
primer_dark['yellow-3']='#d29922'
primer_dark['yellow-4']='#bb8009'
primer_dark['yellow-5']='#9e6a03'
primer_dark['yellow-6']='#845306'
primer_dark['yellow-7']='#693e00'
primer_dark['yellow-8']='#4b2900'
primer_dark['yellow-9']='#341a00'
primer_dark['orange-0']='#ffdfb6'
primer_dark['orange-1']='#ffc680'
primer_dark['orange-2']='#ffa657'
primer_dark['orange-3']='#f0883e'
primer_dark['orange-4']='#db6d28'
primer_dark['orange-5']='#bd561d'
primer_dark['orange-6']='#9b4215'
primer_dark['orange-7']='#762d0a'
primer_dark['orange-8']='#5a1e02'
primer_dark['orange-9']='#3d1300'
primer_dark['red-0']='#ffdcd7'
primer_dark['red-1']='#ffc1ba'
primer_dark['red-2']='#ffa198'
primer_dark['red-3']='#ff7b72'
primer_dark['red-4']='#f85149'
primer_dark['red-5']='#da3633'
primer_dark['red-6']='#b62324'
primer_dark['red-7']='#8e1519'
primer_dark['red-8']='#67060c'
primer_dark['red-9']='#490202'
primer_dark['purple-0']='#eddeff'
primer_dark['purple-1']='#e2c5ff'
primer_dark['purple-2']='#d2a8ff'
primer_dark['purple-3']='#bc8cff'
primer_dark['purple-4']='#a371f7'
primer_dark['purple-5']='#8957e5'
primer_dark['purple-6']='#6e40c9'
primer_dark['purple-7']='#553098'
primer_dark['purple-8']='#3c1e70'
primer_dark['purple-9']='#271052'
primer_dark['pink-0']='#ffdaec'
primer_dark['pink-1']='#ffbedd'
primer_dark['pink-2']='#ff9bce'
primer_dark['pink-3']='#f778ba'
primer_dark['pink-4']='#db61a2'
primer_dark['pink-5']='#bf4b8a'
primer_dark['pink-6']='#9e3670'
primer_dark['pink-7']='#7d2457'
primer_dark['pink-8']='#5e103e'
primer_dark['pink-9']='#42062a'
primer_dark['coral-0']='#ffddd2'
primer_dark['coral-1']='#ffc2b2'
primer_dark['coral-2']='#ffa28b'
primer_dark['coral-3']='#f78166'
primer_dark['coral-4']='#ea6045'
primer_dark['coral-5']='#cf462d'
primer_dark['coral-6']='#ac3220'
primer_dark['coral-7']='#872012'
primer_dark['coral-8']='#640d04'
primer_dark['coral-9']='#460701'
primer_dark_dimmed['black']='#1c2128'
primer_dark_dimmed['white']='#cdd9e5'
primer_dark_dimmed['gray-0']='#cdd9e5'
primer_dark_dimmed['gray-1']='#adbac7'
primer_dark_dimmed['gray-2']='#909dab'
primer_dark_dimmed['gray-3']='#768390'
primer_dark_dimmed['gray-4']='#636e7b'
primer_dark_dimmed['gray-5']='#545d68'
primer_dark_dimmed['gray-6']='#444c56'
primer_dark_dimmed['gray-7']='#373e47'
primer_dark_dimmed['gray-8']='#2d333b'
primer_dark_dimmed['gray-9']='#22272e'
primer_dark_dimmed['blue-0']='#c6e6ff'
primer_dark_dimmed['blue-1']='#96d0ff'
primer_dark_dimmed['blue-2']='#6cb6ff'
primer_dark_dimmed['blue-3']='#539bf5'
primer_dark_dimmed['blue-4']='#4184e4'
primer_dark_dimmed['blue-5']='#316dca'
primer_dark_dimmed['blue-6']='#255ab2'
primer_dark_dimmed['blue-7']='#1b4b91'
primer_dark_dimmed['blue-8']='#143d79'
primer_dark_dimmed['blue-9']='#0f2d5c'
primer_dark_dimmed['green-0']='#b4f1b4'
primer_dark_dimmed['green-1']='#8ddb8c'
primer_dark_dimmed['green-2']='#6bc46d'
primer_dark_dimmed['green-3']='#57ab5a'
primer_dark_dimmed['green-4']='#46954a'
primer_dark_dimmed['green-5']='#347d39'
primer_dark_dimmed['green-6']='#2b6a30'
primer_dark_dimmed['green-7']='#245829'
primer_dark_dimmed['green-8']='#1b4721'
primer_dark_dimmed['green-9']='#113417'
primer_dark_dimmed['yellow-0']='#fbe090'
primer_dark_dimmed['yellow-1']='#eac55f'
primer_dark_dimmed['yellow-2']='#daaa3f'
primer_dark_dimmed['yellow-3']='#c69026'
primer_dark_dimmed['yellow-4']='#ae7c14'
primer_dark_dimmed['yellow-5']='#966600'
primer_dark_dimmed['yellow-6']='#805400'
primer_dark_dimmed['yellow-7']='#6c4400'
primer_dark_dimmed['yellow-8']='#593600'
primer_dark_dimmed['yellow-9']='#452700'
primer_dark_dimmed['orange-0']='#ffddb0'
primer_dark_dimmed['orange-1']='#ffbc6f'
primer_dark_dimmed['orange-2']='#f69d50'
primer_dark_dimmed['orange-3']='#e0823d'
primer_dark_dimmed['orange-4']='#cc6b2c'
primer_dark_dimmed['orange-5']='#ae5622'
primer_dark_dimmed['orange-6']='#94471b'
primer_dark_dimmed['orange-7']='#7f3913'
primer_dark_dimmed['orange-8']='#682d0f'
primer_dark_dimmed['orange-9']='#4d210c'
primer_dark_dimmed['red-0']='#ffd8d3'
primer_dark_dimmed['red-1']='#ffb8b0'
primer_dark_dimmed['red-2']='#ff938a'
primer_dark_dimmed['red-3']='#f47067'
primer_dark_dimmed['red-4']='#e5534b'
primer_dark_dimmed['red-5']='#c93c37'
primer_dark_dimmed['red-6']='#ad2e2c'
primer_dark_dimmed['red-7']='#922323'
primer_dark_dimmed['red-8']='#78191b'
primer_dark_dimmed['red-9']='#5d0f12'
primer_dark_dimmed['purple-0']='#eedcff'
primer_dark_dimmed['purple-1']='#dcbdfb'
primer_dark_dimmed['purple-2']='#dcbdfb'
primer_dark_dimmed['purple-3']='#b083f0'
primer_dark_dimmed['purple-4']='#986ee2'
primer_dark_dimmed['purple-5']='#8256d0'
primer_dark_dimmed['purple-6']='#6b44bc'
primer_dark_dimmed['purple-7']='#5936a2'
primer_dark_dimmed['purple-8']='#472c82'
primer_dark_dimmed['purple-9']='#352160'
primer_dark_dimmed['pink-0']='#ffd7eb'
primer_dark_dimmed['pink-1']='#ffb3d8'
primer_dark_dimmed['pink-2']='#fc8dc7'
primer_dark_dimmed['pink-3']='#e275ad'
primer_dark_dimmed['pink-4']='#c96198'
primer_dark_dimmed['pink-5']='#ae4c82'
primer_dark_dimmed['pink-6']='#983b6e'
primer_dark_dimmed['pink-7']='#7e325a'
primer_dark_dimmed['pink-8']='#69264a'
primer_dark_dimmed['pink-9']='#551639'
primer_dark_dimmed['coral-0']='#ffdacf'
primer_dark_dimmed['coral-1']='#ffb9a5'
primer_dark_dimmed['coral-2']='#f79981'
primer_dark_dimmed['coral-3']='#ec775c'
primer_dark_dimmed['coral-4']='#de5b41'
primer_dark_dimmed['coral-5']='#c2442d'
primer_dark_dimmed['coral-6']='#a93524'
primer_dark_dimmed['coral-7']='#8d291b'
primer_dark_dimmed['coral-8']='#771d13'
primer_dark_dimmed['coral-9']='#5d1008'

export primer_dark_dimmed
export primer_dark
export primer_light
