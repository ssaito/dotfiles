#!/bin/sh
# OS X 用のパッケージ管理の homebrew を使ったインストールスクリプト
# CLI ツールの他に GUI のアプリもインストール管理している
# GUI アプリの管理は homebrew-cask を使う

# Homebrewを最新版にアップデート
brew update

# Formulaを更新
brew upgrade

# homebrew-caskのインストール
brew tap caskroom/cask || true
brew install brew-cask

# パッケージのインストール
brew install zsh
brew install git
brew install tree
brew install tmux
brew install jq
brew install emacs
brew install openssl
brew install source-highlight
brew install colordiff

# アプリのインストール
brew cask install iterm2
brew cask install java
brew cask install google-chrome
brew cask install dropbox
brew cask install virtualbox
brew cask install vagrant
brew cask install evernote
brew cask install eclipse-jee

# 不要なファイルを削除
brew cleanup
