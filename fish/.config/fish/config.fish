# vim mode キーバインド設定
fish_vi_key_bindings

# vimのセットアップ
if ! which vim
    brew install vim
end

# gitのセットアップ
if ! which git
    brew install git
    git config --global user.name "Takurou Nakada"
    git config --global user.email takurou403@gmail.com
    git config --global core.editor vim
end

# 環境設定
if ! test -d $HOME/dotfiles 
    git clone https://github.com/takurou403/dotfiles.git
    ln -s ~/dotfiles/.zsh.d/zshrc ~/.zhsrc
end

# flutterのセットアップ
set -x PATH $HOME/.flutter/bin $PATH
if which flutter
    echo "flutter already exists."
else
    rm -rf ~/.flutter
    git clone https://github.com/flutter/flutter.git ~/.flutter
end

# anyenvのセットアップ
set -x PATH $HOME/.anyenv/bin $PATH
if  which anyenv
    echo "anyenv already is exists."
else
    rm -rf ~/.anyenv
    echo "install anyenv"
    git clone https://github.com/riywo/anyenv ~/.anyenv
    # anyenvの初期化・読込み
    eval (anyenv install --init -y | source)
    # 環境変数設定
    set -x PATH $HOME/.anyenv/bin $PATH
    # プラグインを導入しないとenvが適用できないので取得しアップデートする
    git clone https://github.com/znz/anyenv-update.git (anyenv root)/plugins/anyenv-update
    echo "updating anyenv"
    anyenv update
end

# envsディレクトリのチェック
if ! test -d (anyenv root)/envs
    eval (mkdir (anyenv root)/envs)
else
    echo "(anyenv root)envs directory already is exists."
end

# pyenvのセットアップ
set -x PATH (anyenv root)/envs/pyenv/bin $PATH
if which pyenv
    echo "pyenv already extsts."
else
    echo "enyenv install pyenv."
    anyenv install pyenv
    # exec fish -l
end

# nedenvのセットアップ
set -x PATH $HOME/.nodenv/bin $PATH
if which nodenv
    echo "node already exists."
else
    echo "nodenv install."
    # brew install nodenv
    rm ~/.nodenv
    git clone git://github.com/nodenv/nodenv.git ~/.nodenv
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
    git clone https://github.com/nodenv/node-build-update-defs.git ~/.nodenv/plugins/node-build-update-defs
    eval (nodenv init - | source) 
    # node check
    curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
end

# direnvのセットアップ
if which direnv
    echo "direnv is already exists."
else
    brew install direnv
end
eval (direnv hook fish)
