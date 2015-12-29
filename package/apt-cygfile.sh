#!/bin/sh
#
# @(#) apt-cygfile.sh
#
# Usage:
#  apt-cygfile
#
# Description:
#  apt-cygを使ってcygwin用のパッケージをインストールする
#  brewfileからインスパイヤ
#
###############################################################################

# シェル、ターミナル
apt-cyg install zsh
apt-cyg install tmux

# webツール
apt-cyg install wget
apt-cyg install curl

# バージョン管理
apt-cyg install git
apt-cyg listall subversion       

# クリップボード操作 putclip, getclip
apt-cyg install cygutils-extra

# ファイル同期
apt-cyg install rsync

# 回答
apt-cyg install unzip

## SSH
apt-cyg install openssh
apt-cyg install openssl-devel 


# コンパイラなど
apt-cyg install gcc-core
apt-cyg install gcc-g++
apt-cyg install make
apt-cyg install autoconf
apt-cyg install patch

# lib系
apt-cyg install libxml2
apt-cyg install libxml2-devel
apt-cyg install zlib-devel
apt-cyg install libtool
apt-cyg install libiconv
apt-cyg install libiconv-devel
apt-cyg install libxslt-devel
apt-cyg install libffi-devel
apt-cyg install libgdbm-devel
