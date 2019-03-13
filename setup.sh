#! /bin/sh

CWD=$(dirname `readlink -f $0`)

FILES=".ctags \
       .gitconfig \
       .gitignore \
       .vim \
       .vimrc \
       .zlogin \
       .zshrc \
       .Xresources \
       .xinitrc \
       .config/i3 \
       .config/i3status \
       .config/systemd \
       .gnupg/gpg.conf \
       .gnupg/gpg-agent.conf"

for file in $FILES; do
    mkdir -p $(dirname "$HOME/$file")
    ln -Tvfns "$CWD/$file" "$HOME/$file"
done

vim -c ":PlugInstall" -c ":PlugClean" -c ":qa"
