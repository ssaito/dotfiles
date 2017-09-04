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
pacman -S --noconfirm base-devel
pacman -S --noconfirm mingw-w64-x86_64-toolchain

# lib系
pacman -S --noconfirm libxml2
pacman -S --noconfirm libxml2-devel
pacman -S --noconfirm zlib-devel
pacman -S --noconfirm libtool
pacman -S --noconfirm libiconv
pacman -S --noconfirm libiconv-devel
pacman -S --noconfirm libffi-devel
pacman -S --noconfirm libgdbm-devel

# エディタ
pacman -S mingw-w64-x86_64-emacs
