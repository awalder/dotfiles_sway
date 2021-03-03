#!/usr/bin/env bash

sudo pacman -Syu

function install {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: $1 ..."
        sudo pacman -S --noconfirm $1
    else
        echo "Already installed: $1"
    fi
}


install alacritty
install alsa-firmware
install alsa-utils
install autoconf
install autogen
install playerctl
install base-devel
install bashtop
install bat
install bc
install blueman
install boost
install bpython
install ccls
install clang
install cmake
install ctags
install curl
install docker
install doxygen
install fd
install ffmpeg
install extra-cmake-modules
install figlet
install firefox
install gcc
install gdb
install glances
install grim
install htop
install jq
install libva-mesa-driver
install lld
install lldb
install llvm
install mako
install man-db
install man-pages
install mesa-vdpau
install meson
install mpv
install network-manager-applet
install ninja
install nodejs
install noto-fonts-emoji
install npm
install nyancat
install openconnect
install openssh
install pavucontrol-qt
install pcmanfm
install pulseaudio-alsa
install pulseaudio-bluetooth
install python-pynvim
install python3-pip
install redshift
install ripgrep
install rsync
install scons
install slurp
install socat
install sway
install swaybg
install swayidle
install swaylock
install sxiv
install tig
install tmux
install tree
install ttf-joypixels
install unrar
install unzip
install waybar
install wf-recorder
install wget
install xorg-server-xwayland
install youtube-dl
install vulkan-headers
install vulkan-validation-layers
install zathura
install zathura-pdf-mupdf
install zsh
