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

__m_color() {
  local prefix=
  local postfix=

  local mode=$1
  shift
  if [[ "$mode" == "bash" ]]; then
    prefix=""
    postfix=""
  fi
  if [[ "$mode" == "ps1" ]]; then
    prefix="\["
    postfix="\]"
  fi

  if [[ "$#" = 0 ]]; then
    echo -n "${prefix}\e[0m${postfix}"
  else
    echo -n "${prefix}\e[${1};${2};${3}m${postfix}"
  fi
}


__m_seperator() {
  local C_SEP=$(__m_color $1 2 49 37)
  local C_RST=$(__m_color $1)
  local DSEP=" ${C_SEP}|${C_RST} "
  local SEP=${MARMALADE_PS1_SEPERATOR:-$DSEP}
  echo -n "${SEP}"
}


__m_ps1_user() {
  local p_usr=""
  if [[ -n "${MARMALADE_PS1_DISPLAY_USER-}" ]]; then
    local C_USR=$(__m_color bash 0 49 36)
    local C_MAI=$(__m_color bash 0 49 90)
    local C_RST=$(__m_color bash)
    p_usr="${C_USR}$(whoami)${C_RST}${C_MAI}@${C_RST}${C_USR}$(hostname)${C_RST}$(__m_seperator bash)"
  fi
  echo -en "$p_usr"
}


__m_ps1_pwd() {
  local C_PTH=$(__m_color ps1 0 49 32)
  local C_RST=$(__m_color ps1)
  echo -n "${C_PTH}\w${C_RST}"
}


if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
  source /usr/share/git-core/contrib/completion/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose name"
export GIT_PS1_SHOWCOLORHINTS=true
__m_ps1_git() {
  local C_GIT=$(__m_color bash 1 49 93)
  local C_RST=$(__m_color bash)
  local p_gfr="$(__m_seperator bash)${C_GIT}%s${C_RST}" #__git_ps1 format string
  declare -F __git_ps1 &>/dev/null && __git_ps1 "${p_gfr}"
}


_marmalade_ps1() {
  [[ -z $BASH ]] && return

  local C_MAI=$(__m_color ps1 0 49 90)
  local C_RST=$(__m_color ps1)

  local p_usr="\$(__m_ps1_user)"
  local p_git="\$(__m_ps1_git)"
  local p_pwd="$(__m_ps1_pwd)"


  local ps1_line1="${C_MAI}╭${C_RST} ${p_usr}${p_pwd}${p_git}"
  local ps1_line2="${C_MAI}╰${C_RST} "

  export PS1="${ps1_line1}\n${ps1_line2}"
}

_marmalade_ps1
unset -f _marmalade_ps1
