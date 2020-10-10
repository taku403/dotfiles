#!/bin/bash

# anyenvの環境
export PATH=$HOME/.anyenv/bin/:$PATH
eval "$(anyenv init -)"
# shellをリフレッシュ
exec $SHELL
