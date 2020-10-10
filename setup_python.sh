#!/bin/bash

# ubuntuの場合
apt install -y build-essential
apt install -y libffi-dev
apt install -y libssl-dev # openssl
apt install -y zlib1g-dev
apt install -y liblzma-dev
apt install -y libbz2-dev libreadline-dev libsqlite3-dev

# シェルを再起動
exec $SHELL

# pyenv本体のダウンロードとインストール
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# ubuntuの場合はインストールOPが無いので下記コマンドを実行
bash "$(pyenv root)/plugins/python-build/install.sh"

pyenv install $1
pyenv local $1