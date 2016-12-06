#!/bin/bash

#   author: lwc <ms0472904@gmail.com>
#   modified: 2016/07/12

sudo apt update
sudo apt install -y ssh vim git tmux gcc make g++ gdb build-essential binutils \
                        gcc make g++ gdb build-essential binutils \
                        gcc-multilib g++-multilib \
                        build-essential binutils binutils-multiarch \
                        wget curl \
                        ruby python3 ipython \
                        zlib1g-dev qemu xorg bridge-utils vncviewer \
                        p7zip-full zip unzip rar unrar \
                        htop \
                        ctags cscope exuberant-ctags \
                        python-pip \
                        libssl-dev

sudo apt install -y zsh autojump imagemagick

MYPWD=$(pwd)

## pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

## rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv && src/configure && make -C src


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

vim +PluginInstall +qall
rm -rf ~/.vimrc
ln -s $MYPWD/.vim/vimrc .vimrc

# zsh
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
rm -rf ~/.zshrc
ln -s $MYPWD/.zshrc .zshrc

## zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo chsh -s /bin/zsh


