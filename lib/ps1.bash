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

__m_ps1_color() {
  if [[ "$#" = 0 ]]; then
    echo -n "\[\e[0m\]"
  else
    echo -n "\[\e[${1};${2};${3}m\]"
  fi
}

__m_ps1_get_color() {
  case "$1" in
    reset)
      __m_ps1_color
      ;;
    prefix)
      __m_ps1_color 0 49 95
      ;;
    main)
      __m_ps1_color 0 49 90
      ;;
    seperator)
      __m_ps1_color 0 49 37
      ;;
    user)
      __m_ps1_color 0 49 36
      ;;
    root)
      __m_ps1_color 0 49 31
      ;;
    path)
      __m_ps1_color 0 49 32
      ;;
    git)
      __m_ps1_color 1 49 93
      ;;
    kube_context)
      __m_ps1_color 1 49 34
      ;;
    kube_nsp)
      __m_ps1_color 0 49 37
      ;;
  esac
}


__m_ps1_seperator() {
  local DSEP=${MARMALADE_PS1_SEPERATOR:-$' \u2423 '}
  printf "%s%s%s" $(__m_ps1_get_color seperator) "$DSEP" $(__m_ps1_get_color reset)
}


__m_ps1_user() {
  if [[  "${MARMALADE_PS1_DISPLAY_USER}" == 'false' ]] && [[ ! "`id -u`" -eq 0 ]]; then
    return
  fi

  local USR="$(__m_ps1_get_color user)$USER$(__m_ps1_get_color reset)"
  if [[ "`id -u`" -eq 0 ]]; then
    USR="$(__m_ps1_get_color root)root$(__m_ps1_get_color reset)"
  fi

  printf "%s" "${USR}"
}


__m_ps1_host() {
  if [[ "${MARMALADE_PS1_DISPLAY_HOSTNAME}" == 'false' ]]; then
    return
  fi

  local TO_PRINT=${MARMALADE_PS1_HOSTNAME:-$HOSTNAME}

  printf "%s%s%s" "$(__m_ps1_get_color user)" "${TO_PRINT}" "$(__m_ps1_get_color reset)"
}


__m_ps1_pwd() {
  printf "%s\w%s" $(__m_ps1_get_color path) $(__m_ps1_get_color reset)
}


if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
  source /usr/share/git-core/contrib/completion/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose name"
__m_ps1_git() {
  if [[ "$(type -t __git_ps1)" != 'function' ]]; then
    return
  fi

  local gitp="$(__git_ps1 '%s')"
  if [[ -n "$gitp" ]]; then
    printf "%s%s%s" "$(__m_ps1_get_color git)" "${gitp}" "$(__m_ps1_get_color reset)"
  fi
}


__m_ps1_kube() {
  if [[ -z "${MARMALADE_PS1_DISPLAY_KUBE-}" ]] || [[ ! -x "$(command -v kubectl)" ]]; then
    return
  fi

  local C_CTXD=$(__m_ps1_get_color kube_context)
  local C_NSP=$(__m_ps1_get_color kube_nsp)
  local C_RST=$(__m_ps1_get_color reset)
  printf "%s" $(kubectl config view --minify --output "jsonpath=${C_CTXD}{.current-context}(${C_NSP}{..namespace}${C_CTXD})${C_RST}")
}


__m_ps1() {

  __m_join() {
    local B=""

    if [[ "$#" -eq 0 ]]; then
      return
    fi

    for s in "${@}"; do
      [[ -z "$s" ]] && continue
      local sep="$(__m_ps1_seperator)"
      [[ "${B}" == "" ]] && sep=""
      B="${B}${sep}${s}"
    done

    printf "%s" "$B"
  }

  local C_MAI=$(__m_ps1_get_color prefix)
  local C_SEP=$(__m_ps1_get_color seperator)
  local C_RST=$(__m_ps1_get_color reset)

  local dl=$(__m_join "$(__m_ps1_user)" "$(__m_ps1_host)" "$(__m_ps1_pwd)" "$(__m_ps1_git)" "$(__m_ps1_kube)")

  local d1=$'\u22EE'
  local d2=$'\u22EE'
  local prompt=$'\u2771'

  local ps1_line1="${C_SEP}${d1}${C_SEP} ${dl} ${C_SEP}${d2}${C_SEP}"
  local ps1_line2="${C_MAI}${prompt}${C_RST} "

  export PS1="${ps1_line1}\n${ps1_line2}"
}

export PROMPT_COMMAND=__m_ps1


ps1-kube() {
  if [[ -n "${MARMALADE_PS1_DISPLAY_KUBE-}" ]]; then
    unset MARMALADE_PS1_DISPLAY_KUBE
  else
    export MARMALADE_PS1_DISPLAY_KUBE=true
  fi
}
