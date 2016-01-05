#!/bin/sh
# OS X 用のパッケージ管理の homebrew を使ったインストールスクリプト
# CLI ツールの他に GUI のアプリもインストール管理している
# GUI アプリの管理は homebrew-cask を使う

if type brew > /dev/null 2>&1; then
    echo 'Homebrew installed.'
else
    echo 'Install homebrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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
brew install tmux # マルチターミナル
brew install reattach-to-user-namespace # tmux マウス用
brew install jq # json
brew install emacs
brew install openssl
brew install source-highlight
brew install colordiff
brew install coreutils # gnu コマンド群(ls, ln など)

# アプリのインストール
brew cask install iterm2
brew cask install google-chrome
brew cask install virtualbox
brew cask install vagrant

# 不要なファイルを削除
brew cleanup
