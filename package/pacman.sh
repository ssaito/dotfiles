#!/bin/sh
#
# @(#) packman.sh
#
# Usage:
#  packman
#
# Description:
#  pacmanを使って msys2 用のパッケージをインストールする
#  brewfileからインスパイヤ
#
###############################################################################

# リポジトリ Update
pacman -Sy

# シェル、ターミナル
pacman -S --noconfirm zsh
pacman -S --noconfirm tmux

# webツール
pacman -S --noconfirm wget
pacman -S --noconfirm curl

# バージョン管理
pacman -S --noconfirm git
pacman -S --noconfirm subversion

# ファイル同期
pacman -S --noconfirm rsync

# 圧縮・解凍
pacman -S --noconfirm unzip

## SSH
pacman -S --noconfirm openssh
pacman -S --noconfirm openssl-devel 

# windows用ラッパー
pacman -S --noconfirm winpty

# コンパイラなど
pacman -S --noconfirm make
pacman -S --noconfirm autoconf
pacman -S --noconfirm patch

# lib系
pacman -S --noconfirm libxml2
pacman -S --noconfirm libxml2-devel
pacman -S --noconfirm zlib-devel
pacman -S --noconfirm libtool
pacman -S --noconfirm libiconv
pacman -S --noconfirm libiconv-devel
pacman -S --noconfirm libffi-devel
pacman -S --noconfirm libgdbm-devel
