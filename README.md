# Saito's dotfiles 

dotfiles だけでなくCLI環境構築に必要なファイルを管理するリポジトリです。

## 主要なソフトウェア

* emacs
* zsh
* tmux
* git

## 方針

* OS X、Ubuntu、Windows 同じような使い勝手になるように目指しています。
  + OS XでもGUN系のコマンドを使います。
  + Windowsではcygwinを使います。
* 設定ファイルは共通設定とOSごとの設定分けて管理します。
* OSごとの設定は.localをつけたシンボリックリンクとしてセットアップされます。
  + 拡張子なし: 共通設定
  + .osx: OS Xの設定
  + .ubuntu: Ubuntuの設定
  + .win: Windowsの設定
* 基本的にemacsキーバインドです。

## OS X 向けセットアップ

* http://joker.hatenablog.com/entry/2014/11/09/014607
* http://nomnel.net/blog/boxen-to-brewfile/

## Windows 向けセットアップ

* パッケージ管理のインストール
* https://chocolatey.org/

### CUIの環境整備

#### apt-cygのインストール

wget https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod 755 apt-cyg
mv apt-cyg /usr/local/bin/

wget

nkfは パッケージとしてインストールできないため、ソースからビルドする。
http://osdn.jp/projects/nkf/downloads/59912/nkf-2.1.3.tar.gz/

#### ruby install

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc.local
echo 'eval "$(rbenv init -)"' >> ~/.zshrc.local
$SHELL --login

### フォント

* http://levien.com/type/myfonts/inconsolata.html

#### Windows

* コントロールパネル -> デスクトップのカスタマイズ→フォント」を開いて、ダウンロードしたフォントをドラッグ＆ドロップする

### Emacsの環境整備
* cask 

http://cask.readthedocs.org/en/latest/guide/installation.html#windows-setup

