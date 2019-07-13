!#/bin/sh

LANG=C xdg-user-dirs-gtk-update

sudo apt install vim git w3m gcc gauche manpages-ja manpages-ja-dev xseal powertop tlp

#最新のvscodeをインストール
#作業用のdir
mkdir ~/tmp
wget https://go.microsoft.com/fwlink/?LinkID=760868 -P ~/tmp
dpkg -i '~/tmp/*.deb'

#gitの設定
git --global user.name "takurou403"
git --global user.email "takurou403@gmail.com"
git --global color.ui auto
git --global core.editor /usr/bin/vim

#ubuntuように最適化された省電力アプリをバックグラウンドでスタートする。
sudo tlp start
