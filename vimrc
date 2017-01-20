set nocompatible
filetype off

set encoding=utf-8

"Vundle setup
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle plugins {{{
"Vundle
Plugin 'VundleVim/Vundle.vim'


"Syntastic
Plugin 'scrooloose/syntastic'

"Ultisnips
Plugin 'SirVer/ultisnips'

"Colorscheme
Plugin 'flazz/vim-colorschemes'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'mkarmona/colorsbox'
Plugin 'mhartington/oceanic-next'

"MiniZinc 2.0
Plugin 'vale1410/vim-minizinc'

"Matlab coding syntax
"Plugin 'elmanuelito/vim-matlab-behave'

"Gitgutter
Plugin 'airblade/vim-gitgutter'

"CPP enhanced syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

"NERDtree
Plugin 'scrooloose/nerdtree'

"Completion with tab
"Plugin 'ervandew/supertab'

"Latex handling
Plugin 'jcf/vim-latex'

"Ctrlp
"Plugin 'ctrlmvim/ctrlp.vim'

" fzf
Plugin 'junegunn/fzf', {'dir':'/usr/local/opt/fzf'}

"Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Gundo
Plugin 'sjl/gundo.vim'
"
"YouCompleteMe and essentials
Plugin 'Valloric/YouCompleteMe'
"Plugin 'bjoernd/vim-ycm-tex'

"Handle CSV files
Plugin 'chrisbra/csv.vim'

"Session management
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

"taglist
Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-vinegar'

Plugin 'Raimondi/delimitMate'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'ryanoasis/vim-devicons'

"}}}

call vundle#end()

filetype plugin indent on


runtime! config/**/*.vim


