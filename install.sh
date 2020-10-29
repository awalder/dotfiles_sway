#!/usr/bin/env bash

./aptinstall.sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qa
cp -rv dotfiles/. $HOME/

mkdir -p $HOME/mnt/ananas
mkdir -p $HOME/mnt/media
mkdir -p $HOME/mnt/vol1
mkdir -p $HOME/mnt/vol2

DIR=$(pwd)
sudo cp $DIR/systemd/* /etc/systemd/system/

sudo systemctl enable NetworkManager-wait-online.service
sudo systemctl enable home-awalder-mnt-ananas.mount
sudo systemctl enable home-awalder-mnt-media.mount
sudo systemctl enable home-awalder-mnt-vol1.mount
sudo systemctl enable home-awalder-mnt-vol2.mount


figlet "DONE, move to ZSH and run ./zshsetup.sh"
