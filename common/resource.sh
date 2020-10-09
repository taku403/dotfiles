function usage() {
    # パラメータの詳細を必ず明記すること
    cat << EOS >&2
Usage: $0 [-o OUT_PUT_FILE] [-a] INPUT_FILE
    IPNUT_FILE 入力ファイル
    -o 出力ファイル
    -a オプション ~を~として動作します
EOS
    exit 1
}

