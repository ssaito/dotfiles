#!/bin/sh
#
# put dot files to home directory
#
############################################################

# for zsh
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.zshrc.osx ~/.zshrc.local

# for emacs
ln -s ~/dotfiles/.emacs.d ~/.emacs.d

# for tmux
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux.conf.osx ~/.tmux.conf.local 

# for git
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/.git_template ~/.git_template
ln -s ~/dotfiles/git/.gitignore ~/.gitignore
