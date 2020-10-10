#!/bin/sh

# anyenvで各言語の環境を構築する
git clone https://github.com/riywo/anyenv ~/.anyenv

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
# shell refresh
exec $SHELL -l