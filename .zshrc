zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/exxo/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt inc_append_history
setopt share_history
bindkey -v

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export GOPATH=~/devel/go
export CDPATH=.:~:~/devel
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias la='ls -la --color'
alias ll='ls -l --color'
alias lld='ls -ld --color */'
alias sv='sudoedit'
alias v='vim'
alias o='xdg-open'
alias gr='grep -snIR --color=always'
alias t='tig'
alias ta='tig --all'

alias lpkg='comm -23 <(pacman -Qqe | sort -u) <(pacman -Qqg base -g base-devel | sort -u)'
alias cpkg='sudo sh -c "pacman -Qtdq | xargs -r pacman --noconfirm -Rns && pacman -Sc"'

qemu-start() { systemctl --user start qemu@$1; }
qemu-connect() { stty raw -echo && nc -U "$XDG_RUNTIME_DIR/qemu-$1.socket"; stty sane; }

case $TERM in
    xterm*)
    preexec () {
        echo -n "\033]0;$PWD [$1]\007"
    }
    ;;
esac
