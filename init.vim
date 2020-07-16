call plug#begin()

Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
 
call plug#end()

set termguicolors 
let ayucolor="light"
colorscheme ayu

" IndentLine {{
let g:indentLine_char = '⎸'
let g:indentLine_first_char = '⎸'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
autocmd BufEnter * NERDTreeMirror