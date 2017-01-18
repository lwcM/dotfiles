set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.vim/plugged')

"------------------
" Code Completions
"------------------
"Plug 'Shougo/neocomplcache'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
"Plug 'ervandew/supertab'
" snippets
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" "------ snipmate dependencies -------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
Plug 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/syntastic'

"-------------
" Other Utils
"-------------
Plug 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------

" markdown
" ---------------------------------------
Plug 'tpope/vim-markdown'

" FPs
" ---------------------------------------
Plug 'kien/rainbow_parentheses.vim'

"--------------
" Color Schemes
"--------------
Plug 'altercation/vim-colors-solarized'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on     " required!
