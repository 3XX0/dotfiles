# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/exxo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history
setopt share_history
bindkey -v
# End of lines configured by zsh-newuser-install

alias ll='ls -l --color'
alias lld='ls -ld --color */'
alias rsync='rsync -vh --progress'

alias sysupdate='yaourt -Suya --noconfirm'
alias sysclean='sudo sh -c "pacman -Qtdq | xargs -r pacman --noconfirm -Rns && pacman -Sc"'

grepr() {
    grep -s -n -I -R --color=always -- $1 $@ | sed -e "s/:/ +/"
}

replace() {
    grep -R -I -E $1 2> /dev/null | cut -d ':' -f1 | xargs sed -i -e "/$1/{s;$2;$3;g; w /dev/stdout
    }"
}

export GOPATH=~/dev/go
export CDPATH=.:~:~/dev
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

case $TERM in
    xterm*)
	preexec () {
	    echo -n "\033]0;$PWD [$1]\007"
	}
    ;;
esac
