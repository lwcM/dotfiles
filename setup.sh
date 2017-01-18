#!/bin/bash

#   author: lwc <ms0472904@gmail.com>
#   modified: 2016/07/12

sudo apt update
sudo apt install -y ssh vim git tmux gcc make g++ gdb build-essential binutils \
                        gcc-multilib g++-multilib binutils-multiarch cmake\
                        wget curl \
                        ruby python3 ipython \
                        zlib1g-dev qemu xorg bridge-utils vncviewer \
                        p7zip-full zip unzip rar unrar \
                        htop \
                        ctags cscope exuberant-ctags \
                        python-pip python3-pip\
                        libssl-dev

sudo apt install -y zsh autojump imagemagick
sudo apt install -y powerline
sudo apt install -y vim-gui-common vim-runtime pyflakes

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

rm -rf ~/.vimrc
git clone https://github.com/altercation/vim-colors-solarized.git $MYPWD/.vim/plugged/vim-colors-solarized
ln -s $MYPWD/.vim/vimrc .vimrc
vim +PlugInstall +qall
wget https://raw.githubusercontent.com/JDevlieghere/dotfiles/master/.vim/.ycm_extra_conf.py -O ~/.vim/.ycm_extra_conf.py 2>/dev/null
cd ~/.vim/plugged/youcompleteme/
./install.py --clang-completer
cd ~

# powerline
curl https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf --create-dirs -o ~/.fonts/PowerlineSymbols.otf 2>/dev/null
fc-cache -vf ~/.fonts/
curl https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf --create-dirs -o ~/.config/fontconfig/conf.d/10-powerline-symbols.conf 2>/dev/null

# zsh
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
rm -rf ~/.zshrc
ln -s $MYPWD/.zshrc .zshrc

## zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s /bin/zsh


