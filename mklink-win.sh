#!/bin/sh
#
# msys2 のホームディレクトリのシンボリックリンクを作成する
#
############################################################

# for ln as windows mklink
MSYS=winsymlinks:nativestrict

# for zsh
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshrc.win ~/.zshrc.local

# for emacs
ln -s ~/dotfiles/.emacs.d ~/.emacs.d

# for tmux
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux.conf.win ~/.tmux.conf.local 

# for windows foldar
ln -s /c/Users/p0775825/Downloads ~/downloads
ln -s /c/Users/p0775825/Desktop ~/desktop
ln -s /c/Users/p0775825/Documents ~/documents

# for mintty color
ln -s ~/dotfiles/terminal/.minttyrc ~/.minttyrc
