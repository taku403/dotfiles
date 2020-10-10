#!/bin/bash

source ./common.sh

already_anyenv() {
    # anyenvの存在をチェックする

    # 引数判定
    if [ $# -ne 0 ]; then
        echo "Usage: $0"
        return 1
    fi
    # anyenv 存在チェック
    if $(is_cmd anyenv); then
        # echo "The anyenv already exists."
        return 1
    fi

    return 0
}

setup_anyenv() {
    # anyenvをセットアップする
    
    # 引数判定
    if [ $# -ne 0 ]; then
        echo "Usage: $0"
        return 1
    fi

    # anyenv存在チェック
    if already_anyenv; then
        rm -rf $(anyenv root)
        sed -e 's/export PATH=.*anyenv//g'
    fi

    # anyenvをセットアップ
    git clone https://github.com/riywo/anyenv ~/.anyenv

    echo "export PATH=$HOME/.anyenv/bin:$PATH" >> ~/.bashrc
    echo "export PATH=$(anyenv root)/envs/nodenv/bin:$PATH" >> ~/.bashrc
    eval "$(anyenv init -)"
    exec $SHELL

    # 各**env環境をUpdateするためのプラグインをインストール。
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git  $(anyenv root)/plugins/anyenv-update
    #anyenvをアップデート
    anyenv update
    exit 1

}

# is_cmd() {

#     # 引数で指定したコマンドが存在するか判定する関数。
#     # 第一引数：判定するコマンド名
#     #
#     # return:
#     #  successfully: 1
#     #  failed: 0

#     # 引数が１でない場合
#     if [ $# -ne 1 ]; then
#         echo "Usage: $0 is not argument 1." 1>&2
#         return 1
#     fi

#     # コマンド判定
#     if $(type $1 >/dev/null 2>&1); then
#         return 0
#     else
#         return 1
#     fi

# }

is_cmd $1