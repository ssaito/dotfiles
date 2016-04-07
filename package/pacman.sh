#!/bin/sh
#
# @(#) packman.sh
#
# Usage:
#  packman
#
# Description:
#  pacmanを使ってcygwin用のパッケージをインストールする
#  brewfileからインスパイヤ
#
###############################################################################

# リポジトリ Update
pacman -Sy

# シェル、ターミナル
pacman -S zsh
pacman -S tmux

# webツール
pacman -S wget
pacman -S curl

# バージョン管理
pacman -S git
pacman -S subversion       

# emacs
pacman -S mingw-w64-x86_64-emacs

# ファイル同期
pacman -S rsync

# 回答
pacman -S unzip

## SSH
pacman -S openssh
pacman -S openssl-devel 

# windows用ラッパー
pacman -S winpty

# コンパイラなど
pacman -S gcc-core
pacman -S gcc-g++
pacman -S make
pacman -S autoconf
pacman -S patch

# lib系
pacman -S libxml2
pacman -S libxml2-devel
pacman -S zlib-devel
pacman -S libtool
pacman -S libiconv
pacman -S libiconv-devel
pacman -S libxslt-devel
pacman -S libffi-devel
pacman -S libgdbm-devel
