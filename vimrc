" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file (restore to previous version)
"   if has('persistent_undo')
"     set undofile	" keep an undo file (undo changes after closing)
"   endif
" endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'preservim/nerdcommenter'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_override_foldtext = 0

Plug 'mattn/emmet-vim'

Plug 'StanAngeloff/php.vim'
" let g:php_var_selector_is_identifier = 1
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
  hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
  hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
  syn match phpParentOnly "[()]" contained containedin=phpParent
  hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

Plug 'stephpy/vim-php-cs-fixer'
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
" let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
" let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
" let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
" let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plug 'mkitt/tabline.vim'

" List ends here. Plugins become visible to Vim after this call.
" Automatically executes `filetype plugin indent on` and `syntax enable`. You can revert the settings after the call.
call plug#end()

" 2072/PHP-Indenting-for-VIm
let g:PHP_vintage_case_default_indent = 1

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,gbk,latin1
set ambiwidth=double

set number

set autoindent
set copyindent
set smartindent

set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

set showmatch

set showtabline=2

" set colorcolumn=120
