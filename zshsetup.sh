#!/usr/bin/zsh

export ZDOTDIR=$HOME/.config
git clone --recursive https://github.com/sorin-ionescu/prezto.git $ZDOTDIR/prezto
[ ! -d $HOME/dev/git ] && mkdir $HOME/dev/git
chsh -s /usr/bin/zsh

setopt EXTENDED_GLOB
for rcfile in "$ZDOTDIR"/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
