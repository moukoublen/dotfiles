if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
  source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose name"
export GIT_PS1_SHOWCOLORHINTS=true

_marmalade_ps1() {
  [[ -z $BASH ]] && return

  ## [format];[background color];[foreground color]

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
  ##   25 Reset blink
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

  local C_SEP="\[\033[2;49;37m\]"
  local C_STA="\[\033[2;49;97m\]"
  local F_PTH="\[\033[0;49;32m\]"
  local F_GIT="\[\033[1;49;93m\]"
  local F_MAI="\[\033[0;49;36m\]"
  local F_ROO="\[\033[1;49;91m\]"
  local F_RST="\[\033[0m\]"

  local p_st1="${F_MAI}╭${F_RST}"
  local p_st2="${F_MAI}╰${F_RST}"
  local p_gfr="${F_GIT}%s${F_RST}" #__git_ps1 format string
  local p_git="\$(declare -F __git_ps1 &>/dev/null && __git_ps1 \"${p_gfr}\")"
  local p_pwd="${F_PTH}\w${F_RST}"
  #local p_usr="\$(if [[ \$UID = 0 ]]; then echo -e \"${F_ROO}\"; else echo -e \"${F_MAI}\"; fi)\u${F_RST}"
  local p_usr="${F_MAI}\u${F_RST}"

  local ps1_line1="${p_st1} ${p_usr} ${p_pwd} ${p_git}"
  local ps1_line2="${p_st2} "

  export PS1="${ps1_line1}\n${ps1_line2}"
}

_marmalade_ps1
unset -f _marmalade_ps1
