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

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

" Open a NerdTree if no file is given as CLI argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

autocmd BufReadPre,FileReadPre * :NERDTreeClose