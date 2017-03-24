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

### MSYS2 をインストールする

* http://www.msys2.org/
* C:\msys64\msys2_shell.cmd を管理者で実行可能にする。

``` 
アイコンを右クリック、
「プロパティ」 → 「互換性」 → 「管理者としてこのプログラムを実行する」にチェックを入れる
ショートカットの場合、
「プロパティ」 → 「詳細設定」→「管理者として実行」
```

### Pacman のプロキシ設定を行う

C:\msys64\etc\profile.d 以下に proxy.sh を配置する。PROXY_USER、PROXY_PASSWORD、PROXY_HOST、PROXY_PORTは自身の環境に合わせて変更する

``` shell
export http_proxy=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
export https_proxy=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
export ftp_proxy=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
export HTTP_PROXY=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
export HTTPS_PROXY=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
export FTP_PROXY=http://PROXY_USER:PROXY_PASSWORD@PROXY_HOST:PROXY_PORT/
```

### パッケージインストール

``` shell
pacman -Sy
pacman -S --noconfirm git
git clone https://github.com/ssaito/dotfiles.git
~/dotfiles/package/pacman.sh
~/dotfiles/mklink-win.sh
```


### フォントのインストール

* http://levien.com/type/myfonts/inconsolata.html
* コントロールパネル -> デスクトップのカスタマイズ→フォント」を開いて、ダウンロードしたフォントをドラッグ＆ドロップする

