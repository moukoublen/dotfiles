################################################################################
## BASH colors
## [format];[background color];[foreground color]
## To use colors in PS1 enclose them in escaped (\ prefixed) square brackets e.g. \[\e[2;49;37m\]

##Format
##    1 Bold/Bright
##    2 Dim
##    4 Underlined
##    5 Blink
##    7 Reverse
##    8 Hidden
##    0 Reset all attributes
##   21 Reset bold/bright
##   22 Reset dim
##   24 Reset underlined
##   25 Reset blink__seperator
##   27 Reset reverse
##   28 Reset hidden

##Foreground
##   39 Default foreground color
##   30 Black
##   31 Red
##   32 Green
##   33 Yellow
##   34 Blue
##   35 Magenta
##   36 Cyan
##   37 Light gray
##   90 Dark gray
##   91 Light red
##   92 Light green
##   93 Light yellow
##   94 Light blue
##   95 Light magenta
##   96 Light cyan
##   97 White

##Background
##   49 Default background color
##   40 Black
##   41 Red
##   42 Green
##   43 Yellow
##   44 Blue
##   45 Magenta
##   46 Cyan
##   47 Light gray
##  100 Dark gray
##  101 Light red
##  102 Light green
##  103 Light yellow
##  104 Light blue
##  105 Light magenta
##  106 Light cyan
##  107 White
################################################################################

__ps1_color() {
  if [[ $# == 0 ]]; then
    printf "\[\e[0m\]"
  else
    printf "\[\e[${1};${2};${3}m\]"
  fi
}

declare -A __PS1_COLORS=(
  ["reset"]="$(__ps1_color)"
  ["prefix"]="$(__ps1_color 1 49 35)"
  ["main"]="$(__ps1_color 0 49 90)"
  ["seperator"]="$(__ps1_color 0 49 37)"
  ["user"]="$(__ps1_color 0 49 32)"
  ["root"]="$(__ps1_color 0 49 31)"
  ["path"]="$(__ps1_color 0 49 36)"
  ["git"]="$(__ps1_color 0 49 93)"
  ["gitwrap"]="$(__ps1_color 0 49 33)"
  ["kube_context"]="$(__ps1_color 1 49 34)"
  ["kube_nsp"]="$(__ps1_color 0 49 37)"
)

__ps1_seperator() {
  #local DSEP=${__PS1_SEPERATOR:-$' \u2423 '}  # https://codepoints.net/U+2423
  #local DSEP=${__PS1_SEPERATOR:-$' \u203F '}  # https://codepoints.net/U+203F
  #local DSEP=${__PS1_SEPERATOR:-$' \u2219 '}  # https://codepoints.net/U+2219
  local DSEP=${__PS1_SEPERATOR:-$' \u2022 '} # https://codepoints.net/U+2022
  #local DSEP=${__PS1_SEPERATOR:-$' '}
  printf "%s%s%s" "${__PS1_COLORS[seperator]}" "${DSEP}" "${__PS1_COLORS[reset]}"
}

__ps1_user() {
  local disp=${__PS1_DISPLAY_USER:-false}
  if [[ ${disp} == 'false' ]] && [[ ! "$(id -u)" -eq 0 ]]; then
    return
  fi

  local USR="${__PS1_COLORS[user]}${USER}${__PS1_COLORS[reset]}"
  if [[ "$(id -u)" -eq 0 ]]; then
    USR="${__PS1_COLORS[root]}root${__PS1_COLORS[reset]}"
  fi

  printf "%s" "${USR}"
}

__ps1_host() {
  local disp=${__PS1_DISPLAY_HOSTNAME:-false}
  if [[ ${disp} == 'false' ]]; then
    return
  fi

  local TO_PRINT=${__PS1_HOSTNAME:-${HOSTNAME}}

  printf "%s%s%s" "${__PS1_COLORS[user]}" "${TO_PRINT}" "${__PS1_COLORS[reset]}"
}

__ps1_pwd() {
  printf "%s\w%s" \
    "${__PS1_COLORS[path]}" \
    "${__PS1_COLORS[reset]}"
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose name"
__ps1_git() {
  if [[ "$(type -t __git_ps1)" != 'function' ]]; then
    if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
      source /usr/share/git-core/contrib/completion/git-prompt.sh
    else
      return
    fi
  fi

  local gitp
  gitp="$(__git_ps1 '%s')"
  if [[ -n ${gitp} ]]; then
    printf "%s%s%s%s%s%s" \
      "${__PS1_COLORS[gitwrap]}" \
      $'\uE0A0 ' \
      "${__PS1_COLORS[reset]}" \
      "${__PS1_COLORS[git]}" \
      "${gitp}" \
      "${__PS1_COLORS[reset]}"
  fi
}

__ps1_kube() {
  if [[ -z ${__PS1_DISPLAY_KUBE-} ]] || [[ ! -x "$(command -v kubectl)" ]]; then
    return
  fi

  local C_CTXD="${__PS1_COLORS[kube_context]}"
  local C_NSP="${__PS1_COLORS[kube_nsp]}"
  local C_RST="${__PS1_COLORS[reset]}"
  printf "%s" "$(kubectl config view --minify --output "jsonpath=${C_CTXD}{.current-context}(${C_NSP}{..namespace}${C_CTXD})${C_RST}")"
}

__ps1_join() {
  local sep
  sep="$(__ps1_seperator)"
  local BUF=""

  if [[ $# -eq 0 ]]; then
    return
  fi

  for fn in "${@}"; do
    [[ -z ${fn} ]] && continue
    if [[ ${BUF} == "" ]]; then
      BUF="${fn}"
      continue
    fi
    BUF="${BUF}${sep}${fn}"
  done

  printf "%s" "${BUF}"
}

__ps1() {
  local dl
  dl="$(__ps1_join "$(__ps1_user)" "$(__ps1_host)" "$(__ps1_pwd)" "$(__ps1_git)" "$(__ps1_kube)")"

  #local prompt=$'\u2771' # ❱
  local prompt=$'\u276D' # ❭
  #local prompt=$'\u2192' # →
  #local prompt=$'\u21D2' # ⇒
  #local prompt=$'\u279C' # ➜

  local ps1_line1="${dl}"
  local ps1_line2="${__PS1_COLORS[prefix]}${prompt}${__PS1_COLORS[reset]} "

  export PS1="${ps1_line1}\n${ps1_line2}"
}

export PROMPT_COMMAND=__ps1

ps1-kube() {
  if [[ -n ${__PS1_DISPLAY_KUBE-} ]]; then
    unset __PS1_DISPLAY_KUBE
  else
    export __PS1_DISPLAY_KUBE=true
  fi
}
