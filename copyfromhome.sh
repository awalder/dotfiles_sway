#!/usr/bin/env sh

DIR=$(pwd)

cp $HOME/.config/.zshrc $DIR/dotfiles/.config/

cp $HOME/.clang-format $DIR/dotfiles/
cp $HOME/.gdbinit $DIR/dotfiles/
cp $HOME/.pam_environment $DIR/dotfiles/
cp $HOME/.profile $DIR/dotfiles/
cp $HOME/.tmux.conf $DIR/dotfiles/
cp $HOME/.gitconfig $DIR/dotfiles/

# nvim
cp $HOME/.config/nvim/init.vim $DIR/dotfiles/.config/nvim/
cp $HOME/.config/nvim/cocconfig.vim $DIR/dotfiles/.config/nvim/
cp $HOME/.config/nvim/coc-settings.json $DIR/dotfiles/.config/nvim/

cp -r $HOME/.local/bin $DIR/dotfiles/.local/
cp -r $HOME/docs $DIR/dotfiles/

cp -r $HOME/.config/MangoHud $DIR/dotfiles/.config/
cp -r $HOME/.config/alacritty $DIR/dotfiles/.config/
cp -r $HOME/.config/lf $DIR/dotfiles/.config/
cp -r $HOME/.config/mako $DIR/dotfiles/.config/
cp -r $HOME/.config/redshift $DIR/dotfiles/.config/
cp -r $HOME/.config/rofi $DIR/dotfiles/.config/
cp -r $HOME/.config/sway $DIR/dotfiles/.config/
cp -r $HOME/.config/swaylock $DIR/dotfiles/.config/
cp -r $HOME/.config/sxiv $DIR/dotfiles/.config/
cp -r $HOME/.config/waybar $DIR/dotfiles/.config/
cp -r $HOME/.config/vifm $DIR/dotfiles/.config/
cp -r $HOME/.config/ranger $DIR/dotfiles/.config/

cp -r $HOME/.config/files $DIR/dotfiles/.config/
cp -r $HOME/.config/directories $DIR/dotfiles/.config/

