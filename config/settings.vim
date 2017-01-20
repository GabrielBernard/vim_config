set number

set backspace=2

set mouse=a

"Completion settings
set grepprg=grep\ -nH\ $*


"  Colorscheme{{{
syntax enable

" Colorscheme list in
" .vim/vim-colorscheme.txt

" My favorite:
" badwolf
" candyman
" PaperColor (use for latex)
" colorsbox-stbright
" colorsbox-steighties
" colorsbox-stnight
" hybrid

if has("gui_running")
    set background=dark
    colorscheme oceanicnext 
else
    "set background="dark"
    colorscheme hybrid_material
endif


highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi Folded ctermbg=NONE

au FileType tex set background=light
au FileType tex colorscheme PaperColor
"}}}

"Vim Weird Config {{{

set smarttab		"Better allign tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set showcmd         " show command in bottom bar
set colorcolumn=110
highlight colorcolumn ctermbg=darkgray

set cursorline         " highlight current line
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
set foldlevelstart=0    " open most folds by default
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
nnoremap <F3> :tabnew ~/.vimrc<cr> :vsplit ~/.vim/config/settings.vim<cr>

"let mapleader=","       " leader is comma

" map spell check language change
map <silent> <F7> <Esc>:silent setlocal spell! spelllang=en<CR> :set spell<CR>
map <silent> <F6> <Esc>:silent setlocal spell! spelllang=fr<CR> :set spell<CR>

"}}}

" Indent Line {{{
let g:indentLine_enabled = 1

"}}}

"Compiler{{{
"au FileType cpp set makeprg=\ clang++\ -std=c++11\ -stdlib=libc++\ -Weverything\ -g\ -o\ MyProgram\ %
au FileType cpp set makeprg=\ g++\ -v\ -std=c++14\ -stdlib=libc++\ *.cpp\ -g\ -o\ MyProgram
"au FileType latex set makeprg=\pdflatex\ % ";\ bibtex\ %;\ pdflatex\ %\ pdflatex\ %\

au Filetype java set makeprg=\ javac\ *.java

au FileType tex set makeprg=\ pdflatex\ %;\ pdflatex\ %;\ pdflatex\ %;\ latexmk\ -c;\ open\ *.pdf;

nnoremap <F4> :make!<cr>

nnoremap <F5> :!./MyProgram<cr>

"}}}

" Airline {{{

if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 "tab number
set laststatus=2
set ttimeoutlen=50

if has("gui_running")
    let g:airline_theme='oceanicnext'
endif

au FileType tex let g:airline_theme='papercolor'

let g:airline_powerline_fonts = 1

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

" FZF {{{
set rtp+=/usr/local/opt/fzf
let g:fzf_command_prefix = 'Fzf'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" }}}

" Syntastic {{{

"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w=1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {'passive_filetypes':['java']}

au FileType cpp let g:syntastic_cpp_compiler = 'g++'
au FileType cpp let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++' 

"}}}

"YouCompleteMe{{{

nnoremap ,C :!ctags -R --fields=+l --exclude=.git --exclude=log --exclude=tmp *<CR><CR>

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

" spell check {{{

autocmd BufEnter *.tex set spell spelllang=fr
au BufEnter *.txt set spell spelllang=fr 

" }}}

" From MikesVimrc {{{
set guifont<FONT_NAME>:h<FONT_SIZE>

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11

" Git gitgutter column colors
call gitgutter#highlight#define_highlights()

" Space to toggle folds.
nnoremap <Space> za

"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vim', 'green', 'none', '#00FF00', '#151515')
call NERDTreeHighlightFile('java', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('h', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('cpp', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('log', 'white', 'none', '#FFFFFF', '#151515')
call NERDTreeHighlightFile('txt', 'white', 'none', '#FFFFFF', '#151515')
call NERDTreeHighlightFile('pdf', 'white', 'none', '#FFFFFF', '#151515')
call NERDTreeHighlightFile('jpg', 'blue', 'none', '#00CCCC', '#151515')
call NERDTreeHighlightFile('JPG', 'blue', 'none', '#00CCCC', '#151515')
call NERDTreeHighlightFile('png', 'blue', 'none', '#00CCCC', '#151515')
call NERDTreeHighlightFile('PNG', 'blue', 'none', '#00CCCC', '#151515')
call NERDTreeHighlightFile('bib', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('tex', 'Red', 'none', '#FF0000', '#151515')
call NERDTreeHighlightFile('lot', 'Red', 'none', '#FF0000', '#151515')
call NERDTreeHighlightFile('zip', 'Magenta', 'none', '#ff00ff', '#151515')

"TRLP & GREP
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = 'ag %s -i --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore lib
    \ -g ""'
let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0

" }}}
