#!/usr/bin/env sh

# include $HOME/.local/bin and all subdirectories to PATH
export PATH="/sbin:/usr/sbin:$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*//')"

# Other
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export ZDOTDIR="$HOME/.config"
export DOTDIR="$HOME/.config"
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .os'
export MANPAGER='nvim +Man!'

[ ! -f "$HOME/.config/shortcutrc" ] && shortcuts > /dev/null 2>&1

# if bash, check if .bashrc exists, source .bashrc
echo $0 | grep "bash$" > /dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# xmodmap -e 'clear Lock'             #ensures you're not stuck in CAPS on mode
# xmodmap -e 'keycode 0x42=Escape'    #remaps the keyboard so CAPS LOCK=ESC
