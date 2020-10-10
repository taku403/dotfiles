#!/bin/bash

is_cmd() {

    # 引数で指定したコマンドが存在するか判定する関数。
    # 第一引数：判定するコマンド名
    #
    # return:
    #  successfully: 1
    #  failed: 0

    # 引数が１でない場合
    if [ $# -ne 1 ]; then
        echo "Usage: $0 is not argument 1." 1>&2
        return 1
    fi

    # コマンド判定
    if $(type $1 >/dev/null 2>&1); then
        return 0
    else
        return 1
    fi

}
