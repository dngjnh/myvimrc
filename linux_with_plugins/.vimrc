" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

Plug 'preservim/nerdcommenter'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'tpope/vim-fugitive'

Plug 'mattn/emmet-vim'

Plug 'plasticboy/vim-markdown'

" List ends here. Plugins become visible to Vim after this call.
" Automatically executes `filetype plugin indent on` and `syntax enable`. You can revert the settings after the call.
call plug#end()

set ambiwidth=double
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,gbk,latin1

set hlsearch
set number

set autoindent
set copyindent
set smartindent

set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

set showmatch
