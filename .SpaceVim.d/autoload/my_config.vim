function! my_config#before() abort
    " set things before spacevim stuff
endfunction

function! my_config#after() abort
    " use system clipboard by default
    set clipboard^=unnamed
    " ignore case for search
    set ignorecase smartcase hlsearch
    " clears highlighting on return (for use after searching)
    nnoremap <cr> :noh<CR><CR>:<backspace>
    " minimum number of context lines above/below the cursor
    set scrolloff=3
    " text wrapping
    set wrap linebreak
    " fix scrolling
    nnoremap <C-E> <C-E><C-E><C-E>
    nnoremap <C-Y> <C-Y><C-Y><C-Y>
    " remap leader
    let mapleader = ","
endfunction
