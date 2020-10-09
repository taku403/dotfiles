#!/bin/sh

OS_NOT_FOUND='1'
OS_NOT_FOUND_MSG="このOSには対応していません"
DISTRO_NOT_FOUND_MSG="このディストリビューションには対応していません"
FAILED='1'
SUCCESS='0'

function get_system_type() {
    # 現在動作中のOSを取得する
    # 引数無し
    # 戻り値
        # 成功：0 失敗：１

    # 引数が入力された場合
    if [[ $# -ne 0 ]]; then
        source './common/resource.sh'
        usage
    fi

    # 現在動作中のOSを取得
    os_type=$(get_distro)
    # OSが未対応の場合
    if [[ ${os} -eq ${OS_NOT_FOUND} ]]; then
        echo "このOSには対応していません"
        exit 1
    fi


}

function get_distro() {
    # 現在動作中のディストリビューションを取得する
    if [ $# - ne ]
    # 自環境のOSタイプを取得
    this_os=$(uname -s)
    case $this_os in
        Linux ) return _get_distro_on_linux ;;
    * )
        echo $OS_NOT_FOUND_MSG
        exit $FAILED
    esac

    if [ $(which bash) ]; then
        e
        return 0


    function _get_distro_on_linux() {
        # ディストリビューション名を取得
        distro_name=$(find /etc -name '*-release' -print \
        | xargs -I {} cat {} \
        | grep '^NAME=.*' \
        | xargs -I VAR expr VAR : "NAME=*\(.*\)" )

        case $distro_name in
            Ubuntu ) ;;
            * )
                echo $DISTRO_NOT_FOUND_MSG
                exit $FAILED
    }
}

function prepare_ubuntu() {
    # 環境構築の準備処理
    # パッケージ更新
    apt update
    apt upgreade
    # CSVのヘッダーを除外
    # インストール
}

function install_packages(){
    # CSVに格納されているパッケージをインストールする
    # 第一引数：インストールするCSVファイル
    # csvの構造
    # 第1カラム:　インストールするパッケージ名
    # 第2カラム: 任意、対象のURLからダウンロードしインストールする

    # CSVファイル内容から先頭のレコードを削除
    install_list=remove_csv_header $1
    while read LINE
    do
        install_cmd=$(awk '$2!=""{pirnt $1 $2}')
    done < $(remove_csv_header $install_list)
    if !(type git > /dev/null 2>&1); then
        apt get install git -y
    fi

}
function remove_csv_header() {
    # CSVファイル先頭行削除
    csv=$(sed '1d' in ${1})
    return csv
}
function remove_all_user_install() {
    # ユーザーがインストールしたアプリケーション削除
    # for 
}