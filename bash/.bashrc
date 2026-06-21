case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "

shopt -s checkwinsize
shopt -s globstar
shopt -s autocd

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export PATH="$HOME/.local/bin:$PATH"

__prompt() {
    local last_exit=$?
    local cyan='\[\033[38;5;39m\]'
    local green='\[\033[38;5;76m\]'
    local red='\[\033[38;5;196m\]'
    local yellow='\[\033[38;5;220m\]'
    local bold='\[\033[1m\]'
    local reset='\[\033[0m\]'

    PS1="${cyan}\w${reset}"

    if [ $last_exit -ne 0 ]; then
        PS1+=" ${red}✗ ${last_exit}${reset}"
    fi

    PS1+="\n${bold}❯${reset} "
}
PROMPT_COMMAND=__prompt

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
