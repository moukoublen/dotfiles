### ${@} vs. ${*}
```shell
$*  # Expands to: $1 $2 $3 ...  (word splitting applies)
$@  # Expands to: $1 $2 $3 ...  (word splitting applies)
```


```shell
"$*"  # Expands to: "$1 $2 $3 ..."  (single string, parameters joined by first character of IFS, default space)
"$@"  # Expands to: "$1" "$2" "$3" ...  (each parameter is a separate word)
```

Example:

```shell
set -- "arg 1" "arg 2" "arg 3"

echo "With \$* :"
for arg in "$*"; do
    echo "[$arg]"
done

echo "With \$@ :"
for arg in "$@"; do
    echo "[$arg]"
done
```

Output:
```plain
With $* :
[arg 1 arg 2 arg 3]

With $@ :
[arg 1]
[arg 2]
[arg 3]
```



# Colors

## Reset
`\e[0m`

  * `\e` - the escape character (ASCII 27), often written as \x1b too.
  * `[` - starts the Control Sequence Introducer (CSI).
  * `0` - means reset everything.
  * `m` - end of sequence.

## Classic ANSI SGR codes
`\e[Nm`
  * `\e` - the escape character (ASCII 27), often written as \x1b too.
  * `[` - starts the Control Sequence Introducer (CSI).
  * `N` - Replace `N` with a one of the numbers explained below.
  * `m` - end of sequence.

#### Text Styles
| Code | Meaning                                 |
| ---- | --------------------------------------- |
| `1`  | Bold / increased intensity              |
| `2`  | Faint / decreased intensity             |
| `3`  | Italic (not supported by all terminals) |
| `4`  | Underline                               |
| `5`  | Slow blink                              |
| `6`  | Rapid blink (rarely supported)          |
| `7`  | Reverse video (swap FG/BG)              |
| `8`  | Conceal (hidden text)                   |
| `9`  | Strikethrough                           |
| `21` | Double underline (rare)                 |
| `22` | Normal intensity (cancel bold/faint)    |
| `23` | Not italic                              |
| `24` | Not underlined                          |
| `25` | Stop blinking                           |
| `27` | Stop reverse video                      |
| `28` | Reveal text (cancel conceal)            |
| `29` | Cancel strikethrough                    |

#### Foreground Colors (Text)

**Normal (0–7)**
| Code | Color              |
| ---- | ------------------ |
| `30` | Black              |
| `31` | Red                |
| `32` | Green              |
| `33` | Yellow             |
| `34` | Blue               |
| `35` | Magenta            |
| `36` | Cyan               |
| `37` | White (light gray) |

**Bright (8–15)**
| Code | Color                    |
| ---- | ------------------------ |
| `90` | Bright Black (dark gray) |
| `91` | Bright Red               |
| `92` | Bright Green             |
| `93` | Bright Yellow            |
| `94` | Bright Blue              |
| `95` | Bright Magenta           |
| `96` | Bright Cyan              |
| `97` | Bright White             |

#### Background Colors

**Normal**
| Code | Color   |
| ---- | ------- |
| `40` | Black   |
| `41` | Red     |
| `42` | Green   |
| `43` | Yellow  |
| `44` | Blue    |
| `45` | Magenta |
| `46` | Cyan    |
| `47` | White   |

**Bright**
| Code  | Color          |
| ----- | -------------- |
| `100` | Bright Black   |
| `101` | Bright Red     |
| `102` | Bright Green   |
| `103` | Bright Yellow  |
| `104` | Bright Blue    |
| `105` | Bright Magenta |
| `106` | Bright Cyan    |
| `107` | Bright White   |

They can be chained together

```shell
# Bright cyan foreground
printf "\e[0;96m  Bright Cyan Text  \e[0m \n"
printf "\e[1;31m  Bold Red  \e[0m\n"
printf "\e[4;93;104m  Yellow on Blue Underlined  \e[0m \n"
printf "\e[7m  Reverse Colors  \e[0m \n"
printf "\e[1;3;95;100m  Fancy Text  \e[0m\n"
```

## 256-color syntax
`\e[48;5;1m`

  * `\e` - the escape character (ASCII 27), often written as \x1b too.
  * `[` - starts the Control Sequence Introducer (CSI).
  * `48` - means “set background color.” (Foreground color would be `38`.)
  * `5` - says “use 256-color palette mode” (as opposed to direct RGB).
  * `1` - the color index from the 256-color palette (0–255).

```plain
0..7 = standard ANSI colors
8..15 = bright ANSI colors
16..231 = RGB cube
232..255 = grayscale ramp
```

example: `echo -e "\e[38;5;124m text text \e[0m"`

## Truecolor syntax (24-bit)
`\e[38;2;R;G;Bm`, `\e[48;2;R;G;Bm`

  * `\e` - the escape character (ASCII 27), often written as \x1b too.
  * `[` - starts the Control Sequence Introducer (CSI).
  * `48` - means "set background color." (Foreground color would be `38`.)
  * `2` - says "direct RGB values" (as opposed to 5 for a palette index)
  * `R;G;B` - the red, green, and blue color components (0–255 each)
  * `m` - end of sequence

example: `echo -e "\e[38;2;123;43;13m text text \e[0m"`

