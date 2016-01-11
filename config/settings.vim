set number

set backspace=2

set mouse=a

"Completion settings
set grepprg=grep\ -nH\ $*


" Colorscheme{{{
syntax enable

"github colorscheme
"set background=light
"let g:github_termtrans=1
"let g:github_termcolors=256
"let g:github_contrast="high"
"let g:github_visibility="high"
"colorscheme github

"sol
"set background=light
"let g:sol_termtrans=1
"let g:sol_termcolors=256
"let g:sol_contrast="high"
"let g:sol_visibility="high"
"colorscheme sol

"Solarized
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"let g:solarized_degrade=0
"let g:solarized_bold=1 "|0
"let g:solarized_underline=1 "|0
"let g:solarized_italic=1 "|0
"let g:solarized_contrast="normal" "|normal |high |low
"let g:solarized_visibility="normal"  "normal |high |low
"colorscheme solarized

"badwolf
"let g:badwolf_darkgutter=1
"let g:badwolf_tabline=1
"let g:badwolf_html_link_underline=1
"let g:badwolf_css_props_highlight=0
"colorscheme badwolf

"Molokai
"let g:molokai_original=1
"let g:rehash256=1
"colorscheme Molokai

"railscasts
"colorscheme railscasts

"sprinkles
"set background=light
"let g:sprinkles_termtrans=1
"let g:sprinkles_termcolors=256
"let g:sprinkles_contrast="high"
"let g:sprinkles_visibility="high"
"colorscheme sprinkles

"earendel
"set background=light
"let g:earendel_termtrans=1
"let g:earendel_termcolors=256
"let g:earendel_contrast="high"
"let g:earendel_visibility="high"
"colorscheme earendel


if has("gui_running")
    colorscheme badwolf
else
    colorscheme candyman
endif


highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi Folded ctermbg=NONE

"}}}

"Vim Weird Config {{{

set smarttab		"Better allign tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
set colorcolumn=110
highlight colorcolumn ctermbg=darkgray

"set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set relativenumber      " Puts relative numbers

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default
set foldnestmax=10      " 10 nested fold max

set foldmethod=marker   " fold based on indent level
set foldlevel=1
set modelines=1

" Split config
set splitbelow
set splitright

" Permet le word wrapping
set formatoptions+=1
set tw=105
set wrap linebreak nolist
set textwidth=0
set wrapmargin=0

"}}}

"Remapping {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" new tab

"vimrc racourcis
nnoremap <F3> :tabnew ~/.vimrc<cr>

"let mapleader=","       " leader is comma
"}}}

"Compiler{{{
"au FileType cpp set makeprg=\ clang++\ -std=c++11\ -stdlib=libc++\ -Weverything\ -g\ -o\ MyProgram\ %
au FileType cpp set makeprg=\ g++\ -v\ -std=c++14\ -stdlib=libc++\ *.cpp\ -g\ -o\ MyProgram
"au FileType latex set makeprg=\pdflatex\ % ";\ bibtex\ %;\ pdflatex\ %\ pdflatex\ %\

au FileType tex set makeprg=\ xelatex\ %;\ bibtex\ projet;\ xelatex\ %;\ xelatex\ %;\ latexmk\ -c;

nnoremap <F4> :make!<cr>

nnoremap <F5> :!./MyProgram<cr>

"}}}

" Airline {{{

"let g:airline_theme='solarized'

if !exists("g:airline_symbols")
      let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number

" }}}

" Gundo + Backup {{{

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

"persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

nnoremap <F1> :GundoToggle<CR>

" }}}

" Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w=1
let g:syntastic_check_on_wq = 0

au FileType cpp let g:syntastic_cpp_compiler = 'g++'
au FileType cpp let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

"}}}

"YouCompleteMe{{{

nnoremap <leader>C :!ctags -R --fields=+l --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_conf.py"

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_show_diagnostics_ui = 0
"let g:ycm_retister_as_syntastic_checker = 0
"}}}

" Session management {{{

let g:session_directory="~/.vim/sessions"
let g:session_autoload="no"
let g:session_autosave="no"
"}}}

" cpp-enhanced-highlight {{{

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" }}}

