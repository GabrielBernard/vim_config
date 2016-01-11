"Fichier de configuration vim-latex
let g:latex_enable = 1
let g:latex_complete_enabled = 1
let g:latex_indent_enabled = 1
let g:latex_mappings_enabled = 1

" Fichier de configuration latex-suite
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

"Alt-keys
set winaltkeys=no

set iskeyword+=:,-,_

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
"let g:tex_flavor='pdflatex'
"let g:latex_latexmk_options="-pdf -pvc -pdflatex='pdflatex -file-line-error -synctex=1'"
"let g:TTarget='pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex $*.pdf'

set complete-=k complete+=k
set complete+=kspell
set complete+=]

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabLongestEnhanced = 1

autocmd FileType tex
            \ if &omnifunc != '' |
            \   call SuperTabChain(&omnifunc, "<c-n>") |
            \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
            \ endif

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <tab> pumvisible() ? '<tab>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"===== 
" For custom mappings 
imap <D-p> <Plug>Tex_InsertItemOnThisLine

imap <D-b> <Plug>Tex_MathBF
imap <D-c> <Plug>Tex_MathCal
imap <D-l> <Plug>Tex_LeftRight
imap <D-i> <Plug>Tex_InsertItemOnThisLine 
imap <D-u> <Plug>Tex_InsertItemOnThisLine 
imap <D-y> <Plug>Tex_InsertItemOnNextLine 

"sertItemOnNextLine 

"imap <C-b> <Plug>Tex_MathBF
"imap <C-c> <Plug>Tex_MathCal 
"imap <C-l> <Plug>Tex_LeftRight 
"imap <C-u> <Plug>Tex_InsertItemOnThisLine 
"imap <C-y> <Plug>Tex_InsertItemOnNextLine 

"imap <A-u> <Plug>Tex_InsertItemOnThisLine 
"imap <A-y> <Plug>Tex_InsertItemOnNextLine 
" 
"======
