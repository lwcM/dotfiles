#!/bin/bash

#   author: lwc <ms0472904@gmail.com>
#   modified: 2016/07/12

sudo apt-get update
sudo apt-get install -y ssh vim git tmux gcc make g++ gdb build-essential binutils \
                        gcc make g++ gdb build-essential binutils \
                        gcc-multilib g++-multilib \
                        build-essential binutils binutils-multiarch \
                        wget curl \
                        ruby python3 ipython \
                        zlib1g-dev qemu xorg bridge-utils vncviewer \
                        p7zip-full zip unzip rar unrar \
                        htop \
                        ctags cscope exuberant-ctags \
                        python-pip

MYPWD=$(pwd)
cd ~

# tmux
rm -rf ~/.tmux.conf
ln -s $MYPWD/.tmux.conf .tmux.conf

# bashrc
rm -rf ~/.bashrc
ln -s $MYPWD/.bashrc .bashrc

# vim
rm -rf ~/.vim
ln -s $MYPWD/.vim .vim
git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle

rm -rf ~/.vimrc
ln -s $MYPWD/.vim/vimrc .vimrc

vim +PluginInstall +qall
source ~/.bashrc

