"=== PLUGINS ==="
" Pathogen plugin manager (put em in ~/.vim/bundle)
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['jedi-vim', 'auto-pairs', 'python-mode']
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

set omnifunc=syntaxcomplete#Complete


"=== AESTHETICS ==="
syntax enable

if has('gui_running')
    set guifont=Bitstream\ Vera\ Sans\ Mono:h13
endif

colorscheme spacegray

" line number conf
set relativenumber
set number

" overlength line highlighting
" highlight OverLength ctermbg=red ctermfg=white guibg=#ff9999
" match OverLength /\%81v.\+/

" vsplit highlighting
highlight VertSplit ctermfg=235 ctermbg=239

" cursor customization
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
else
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
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
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
" https://medium.com/@sszreter/vim-tab-autocomplete-in-insert-mode-and-fuzzy-search-for-opening-files-484260f52618
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
" TODO check out selecta for file opening if you want
" https://github.com/garybernhardt/selecta



"=== KEYMAPPINGS ===""
let mapleader = ","
" easier saving and closing
noremap <C-W><C-W> :wq<CR>
" vertical split faster
noremap <leader>vs :vsplit<CR>
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

" default to system clipboard
set clipboard^=unnamed

" templating
if has("autocmd")
augroup templates
    autocmd BufNewFile test*.py 0r ~/.vim/templates/python-test.py
augroup END
endif
