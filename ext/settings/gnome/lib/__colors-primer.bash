#!/usr/bin/env bash

declare -A primer_c
primer_c['gray-0']='#fafbfc #f0f6fc #cdd9e5'
primer_c['gray-1']='#f6f8fa #c9d1d9 #adbac7'
primer_c['gray-2']='#e1e4e8 #b1bac4 #909dab'
primer_c['gray-3']='#d1d5da #8b949e #768390'
primer_c['gray-4']='#959da5 #6e7681 #636e7b'
primer_c['gray-5']='#6a737d #484f58 #545d68'
primer_c['gray-6']='#586069 #30363d #444c56'
primer_c['gray-7']='#444d56 #21262d #373e47'
primer_c['gray-8']='#2f363d #161b22 #2d333b'
primer_c['gray-9']='#24292e #0d1117 #22272e'
primer_c['blue-0']='#f1f8ff #cae8ff #c6e6ff'
primer_c['blue-1']='#dbedff #a5d6ff #96d0ff'
primer_c['blue-2']='#c8e1ff #79c0ff #6cb6ff'
primer_c['blue-3']='#79b8ff #58a6ff #539bf5'
primer_c['blue-4']='#2188ff #388bfd #4184e4'
primer_c['blue-5']='#0366d6 #1f6feb #316dca'
primer_c['blue-6']='#005cc5 #1158c7 #255ab2'
primer_c['blue-7']='#044289 #0d419d #1b4b91'
primer_c['blue-8']='#032f62 #0c2d6b #143d79'
primer_c['blue-9']='#05264c #051d4d #0f2d5c'
primer_c['green-0']='#f0fff4 #aff5b4 #b4f1b4'
primer_c['green-1']='#dcffe4 #7ee787 #8ddb8c'
primer_c['green-2']='#bef5cb #56d364 #6bc46d'
primer_c['green-3']='#85e89d #3fb950 #57ab5a'
primer_c['green-4']='#34d058 #2ea043 #46954a'
primer_c['green-5']='#28a745 #238636 #347d39'
primer_c['green-6']='#22863a #196c2e #2b6a30'
primer_c['green-7']='#176f2c #0f5323 #245829'
primer_c['green-8']='#165c26 #033a16 #1b4721'
primer_c['green-9']='#144620 #04260f #113417'
primer_c['purple-0']='#f5f0ff #eddeff #eedcff'
primer_c['purple-1']='#e6dcfd #e2c5ff #dcbdfb'
primer_c['purple-2']='#d1bcf9 #d2a8ff #dcbdfb'
primer_c['purple-3']='#b392f0 #bc8cff #b083f0'
primer_c['purple-4']='#8a63d2 #a371f7 #986ee2'
primer_c['purple-5']='#6f42c1 #8957e5 #8256d0'
primer_c['purple-6']='#5a32a3 #6e40c9 #6b44bc'
primer_c['purple-7']='#4c2889 #553098 #5936a2'
primer_c['purple-8']='#3a1d6e #3c1e70 #472c82'
primer_c['purple-9']='#29134e #271052 #352160'
primer_c['yellow-0']='#fffdef #f8e3a1 #fbe090'
primer_c['yellow-1']='#fffbdd #f2cc60 #eac55f'
primer_c['yellow-2']='#fff5b1 #e3b341 #daaa3f'
primer_c['yellow-3']='#ffea7f #d29922 #c69026'
primer_c['yellow-4']='#ffdf5d #bb8009 #ae7c14'
primer_c['yellow-5']='#ffd33d #9e6a03 #966600'
primer_c['yellow-6']='#f9c513 #845306 #805400'
primer_c['yellow-7']='#dbab09 #693e00 #6c4400'
primer_c['yellow-8']='#b08800 #4b2900 #593600'
primer_c['yellow-9']='#735c0f #341a00 #452700'
primer_c['orange-0']='#fff8f2 #ffdfb6 #ffddb0'
primer_c['orange-1']='#ffebda #ffc680 #ffbc6f'
primer_c['orange-2']='#ffd1ac #ffa657 #f69d50'
primer_c['orange-3']='#ffab70 #f0883e #e0823d'
primer_c['orange-4']='#fb8532 #db6d28 #cc6b2c'
primer_c['orange-5']='#f66a0a #bd561d #ae5622'
primer_c['orange-6']='#e36209 #9b4215 #94471b'
primer_c['orange-7']='#d15704 #762d0a #7f3913'
primer_c['orange-8']='#c24e00 #5a1e02 #682d0f'
primer_c['orange-9']='#a04100 #3d1300 #4d210c'
primer_c['red-0']='#ffeef0 #ffdcd7 #ffd8d3'
primer_c['red-1']='#ffdce0 #ffc1ba #ffb8b0'
primer_c['red-2']='#fdaeb7 #ffa198 #ff938a'
primer_c['red-3']='#f97583 #ff7b72 #f47067'
primer_c['red-4']='#ea4a5a #f85149 #e5534b'
primer_c['red-5']='#d73a49 #da3633 #c93c37'
primer_c['red-6']='#cb2431 #b62324 #ad2e2c'
primer_c['red-7']='#b31d28 #8e1519 #922323'
primer_c['red-8']='#9e1c23 #67060c #78191b'
primer_c['red-9']='#86181d #490202 #78191b'
primer_c['pink-0']='#ffeef8 #ffdaec #ffd7eb'
primer_c['pink-1']='#fedbf0 #ffbedd #ffb3d8'
primer_c['pink-2']='#f9b3dd #ff9bce #fc8dc7'
primer_c['pink-3']='#f692ce #f778ba #e275ad'
primer_c['pink-4']='#ec6cb9 #db61a2 #c96198'
primer_c['pink-5']='#ea4aaa #bf4b8a #ae4c82'
primer_c['pink-6']='#d03592 #9e3670 #983b6e'
primer_c['pink-7']='#b93a86 #7d2457 #7e325a'
primer_c['pink-8']='#99306f #5e103e #69264a'
primer_c['pink-9']='#6d224f #42062a #551639'


declare -A primer_dark_dimmed
declare -A primer_dark
declare -A primer_light

for key in "${!primer_c[@]}"; do
  c=(${primer_c[${key}]})
  primer_dark_dimmed[${key}]="${c[2]}"
  primer_dark[${key}]="${c[1]}"
  primer_light[${key}]="${c[0]}"
done


export primer_dark_dimmed
export primer_dark
export primer_light

#for key in "${!primer_dark_dimmed[@]}"; do echo $key; done
#for val in "${primer_dark_dimmed[@]}"; do echo $val; done


