
"=== PLUGINS ==="

" Pathogen plugin manager (put em in ~/.vim/bundle)
execute pathogen#infect()

" for auto-pairs: any closing bracket will force close any open
let g:AutoPairsFlyMode = 1

" for nerdcommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" for airline
" let g:airline_powerline_fonts = 0
let g:airline_theme='ravenpower' " good for any theme
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L : %c'

" for syntastic (TODO: read and understand)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



"=== AESTHETICS ==="
syntax enable

if has('gui_running')
    set guifont=Bitstream\ Vera\ Sans\ Mono:h13
endif

" line number conf
set relativenumber
set number

" overlength line highlighting
highlight OverLength ctermbg=red ctermfg=white guibg=#ff9999
match OverLength /\%81v.\+/

" vsplit highlighting
highlight VertSplit ctermfg=235 ctermbg=239

" cursor customization
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode
endif



"=== IDE FUNCTIONALITY ==="

" tags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
" indentation
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set autoindent shiftround smarttab
" text wrapping
set wrap linebreak
" tab completion shows menu
set wildmenu
" cursor can exist after lines
" set virtualedit=all
" flash matching bracket while inserting
set showmatch
" search stuff
set ignorecase smartcase hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" always vsplit to the right
set splitright
" files ignored when expanding wildcards
set wildignore=*.swp,*.bak,*.pyc,*.class
" undo more
set undolevels=1000



"=== KEYMAPPINGS ===""
let mapleader = ","

" easier saving and closing
map <C-W><C-W> :wq<CR>

" shorcut to edit this file
nmap <silent> <leader>vrc : e $MYVIMRC<CR>

" vertical split faster
map <leader>vs :vsplit<CR>

" allow easier switching between frames
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" larger faster e/y scrolling
nnoremap <C-E> <C-E><C-E><C-E>
nnoremap <C-Y> <C-Y><C-Y><C-Y>

"=== MISCELLANEOUS CONFIGURATIONS =="
set laststatus=2
set hidden

