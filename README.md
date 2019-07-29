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

### Dock

自動的に表示/非表示

### trackpad

* 調べる＆データ検出:３本指でタップ
* 副ボタンのクリック:2本指でクリック
* スクロールとズーム：全部対応

3本指でのトラックパッド操作
移行前のMacでは3本指でウィンドウをドラッグし、ブラウザを掴んで動かしたり上下左右に広げていた。

新Macの[システム環境設定]->「トラックパッド」にはそれらしい設定が見つからないが、
[システム環境設定]->[アクセシビリティ]->[マウスとトラックパッド]->[トラックパッドオプション]で「ドラッグを有効にする」にチェックからの「3本指でドラッグ」で有効になる。

### キーボード

Touch Bar: F1、F2などのキー
装飾キー: 
  Caps Lock Option

## Windows 向けセットアップ

### MSYS2 をインストールする

* http://www.msys2.org/
* C:\msys64\msys2_shell.cmd を管理者で実行可能にする。

``` 
アイコンを右クリック、
「プロパティ」 → 「互換性」 → 「管理者としてこのプログラムを実行する」にチェックを入れる
ショートカットの場合、
「プロパティ」 → 「詳細設定」→「管理者として実行」
```

* ショートカットのリンク先

``` 
C:\msys64\msys2_shell.cmd -mingw64
```

### 環境変数 PATH の設定(windows10の場合)
デフォルトでは、Windows の環境変数 PATH の設定を 引き継がない。
コントロールパネル → システムとセキュリティ → システム → システムの詳細設定 →詳細設定 → 環境変数 から
Windows の環境変数に MSYS2_PATH_TYPE を追加し、値を inherit に設定する。

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

* バイナリーダウンロード
  + https://github.com/BurntSushi/ripgrep
    - ripgrep は強力なgrep
    - ダウンロードした rg.exe を /bin にコピーする

### フォントのインストール

* http://levien.com/type/myfonts/inconsolata.html
* コントロールパネル -> デスクトップのカスタマイズ→フォント」を開いて、ダウンロードしたフォントをドラッグ＆ドロップする

### Emacsのインストール

* el-getの問題を解決しよう
* http://d.hatena.ne.jp/zqwell-ss/20130324/1364129779


### Git

``` shell
$ ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
$ ln -s ~/dotfiles/git/.git_template ~/.git_template
$ ln -s ~/dotfiles/git/.gitignore ~/.gitignore
```

### dotfiles のリポジトリ設定

$ git config --local user.name "ssaito"
$ git config --local user.email "${email}"

