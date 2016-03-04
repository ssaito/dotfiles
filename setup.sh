#!/bin/sh

# ホームディレクトリにリンクを作成する
# DOT_FILES=( .zshrc .gitconfig .tmux.conf)

# for file in ${DOT_FILES[@]}
# do
#     ln -s $HOME/dotfiles/$file $HOME/$file
#     if [ $? -le 0 ]; then
#         echo "created $HOME/$file"
#     fi
# done

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 9)" == 'CYGWIN_NT' ]; then                                        
    echo "Your platform is Cygwin"
    # Windowsのコンソール環境の構築
    
    # Windows専用設定のリンクを作成する
    file=.zshrc.local
    ln -s $HOME/dotfiles/.zshrc.win $HOME/$file

    # cygwin .gitcofig はハードリンクでなけばはらない

    # apt-cyg のインストール
    wget https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
    chmod 755 apt-cyg
    mv apt-cyg /usr/bin/apt-cyg
    
    # apt-cyg のミラーサイトのアップデート
    apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update

    # apt-cyg を使ってパッケージをインストール
    # zsh にログインシェルを変更する
    # /etc/passwd がなかったら作る
    mkpasswd -l > /etc/passwd
    mkpasswd | sed "s/\:\/bin\/bash/\:\/bin\/zsh/g" > /etc/passwd

    if [ $? -le 0 ]; then
        echo "created $HOME/$file"
    fi
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi


# mintty リンク
ln -s ~/dotfiles/terminal/.minttyrc ~/.minttyrc


# for git
git config user.name "ssaito"
git config user.email "shinya.saito.25a@gmail.com"

# for python
pip install rope
pip install jedi
pip install flake8
pip install importmagic
