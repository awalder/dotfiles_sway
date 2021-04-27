# Prezto load
[ -f "$HOME/.config/prezto/init.zsh" ] && source "$HOME/.config/prezto/init.zsh"
# [ -f "$HOME/.config/powerlevel10k/powerlevel10k.zsh-theme" ] && source "$HOME/.config/powerlevel10k/powerlevel10k.zsh-theme"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

stty -ixon
eval "$(direnv hook zsh)"

export MAKEFLAGS="-j64"
export UIC_CMD=/usr/lib/qt4/bin/uic
export RCC_CMD=/usr/lib/qt4/bin/rcc
export MOC_CMD=/usr/lib/qt4/bin/moc

# export BOOST_ROOT=/usr/include/boost/
export LDFLAGS="-fuse-ld=lld"

export DISTCC_HOSTS="192.168.1.136/64 +zeroconf"     # Unraid VM
# export DISTCC_HOSTS="10.8.130.190 +zeroconf"
export EXTRA_SCONSFLAGS="--shared --ln --m64 --clang --pretty --decider=MD5"

alias koneconnect='sudo openconnect --juniper ssl.kone.com/junos --background --user=con_awalder'
alias konedisconnect='sudo pkill openconnect'

    # prompt \
zstyle ':prezto:load' module \
    history \
    history-substring-search \
    completion
    # utility \

promptinit
prompt powerlevel10k

[ -f "$HOME/.config/.p10k.zsh" ] && source "$HOME/.config/.p10k.zsh"

bindkey '\eOA' history-beginning-search-backward
bindkey '\e[A' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '\e[B' history-beginning-search-forward

# This should be last
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2> /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
