au FileType gitcommit set tw=72 | set spell | set colorcolumn=50
set nocompatible              
filetype off                 
"In case the shell being used is fish which has problems with 
"plugins like syntastic
"set rtp+=~/.vim/plugged/gruvbox/colors/gruvbox.vim
set number
set statusline+=%{SyntasticStatuslineFlag()} 
"set runtimepath
""""""""""""""
"THEMING
""""""""""""""
let base16colorspace=256
set t_co=256
set background=dark
set number
"set tabbing to 4 spaces.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

set laststatus=2
""""""""""""""""""""
"vim-plug setup
""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'valloric/youcompleteme',{ 'do': './install.sh --clang-complete' }
Plug 'raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'skammer/vim-css-color'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/syntastic'
Plug 'jpalardy/vim-slime'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'maksimr/vim-jsbeautify'
Plug 'chriskempson/base16-vim'
call plug#end()


""""""""""""
"BINDINGS
""""""""""""
"EMMET
""""""""""""
map <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
""""""""""""
"INCSEARCH
""""""""""""
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
""""""""""""
"NERDTREE
""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""
"FUGITIVE
""""""""""""
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

"""""""""""
"Syntastic"
"""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""
" YOU COMPLETE ME "
"""""""""""""""""""
let g:clang_complete_auto = 1
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_user_options='|| exit 0'
