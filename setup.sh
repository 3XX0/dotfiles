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
       .config/systemd"

for file in $FILES; do
    ln -vfns "$CWD/$file" "$HOME/$file"
done

vim -c ":PlugInstall"
