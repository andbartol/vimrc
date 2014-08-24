" Vundle settings ----------------------------{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/Command-T'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'hsanson/vim-android'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/AutoComplPop'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Autocmds -----------------------------{{{
aug tutto
	autocmd!
	au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	au InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd! bufwritepost .vimrc source %
	autocmd FileType python :call Python()
aug END
" }}}
" Settings --------------------------{{{
" Per firefox il default non basta
let g:CommandTMaxFiles = 301000
let g:CommandTMaxHeight = 30
" E' più veloce
let g:CommandTFileScanner = 'find'
let g:CommandTCancelMap = ['<ESC>','<C-c>']
let g:miniBufExplMapCTabSwitchBufs = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:android_sdk_path = '~/android-studio/sdk/'
"let g:android_sdk_tags = '~/android-studio/sdk/tags/tags'
"set tags=/home/andrea/.vim/tags/tags
colorscheme badwolf
filetype indent on
filetype on
filetype plugin on
let mapleader=","
map <C-Tab> <Tab>
set backspace=2
set clipboard=unnamed
set hlsearch
set laststatus=2
set nobackup
set noswapfile
set nowritebackup
set number
set ruler
set showcmd
set tags=/home/andrea/vim/src/vimtags
set tags+=/home/andrea/.vim/tags/st1
set t_Co=256
syntax enable
" }}}
" Key Mapping -------------------------------{{{
inoremap <c-c> <esc>cdi
"inoremap cc <esc>Vyp
inoremap <c-d> <esc>ddi
inoremap <c-s> <esc>:w<CR>a
inoremap <c-u> <esc>viwUi
inoremap <c-x> <esc><c-r>i
inoremap <c-z> <esc>ui
inoremap <esc> <nop>
inoremap jk <esc>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap . :
nnoremap : .
nnoremap cd :<C-U>execute "normal! Vy" . v:count1 . "p"<CR>
nnoremap <c-m> :noh<CR>
nnoremap <c-s> :w<CR>
nnoremap <c-u> viwU<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
onoremap i, :call SelectArgument()<cr>
vnoremap <c-s> <esc>:w<CR>v
vnoremap < <gv
vnoremap > >gv
" vib per selezionare un blocco dentro le parentesi
" vi" o vi' per scrivere dentro le virgolette più vicine
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
" }}}
" Functions ----------------{{{
function! SelectArgument()
	call search("[,)]")
	let l:curr_char = getline(".")[col(".")-1]
	if l:curr_char == ')'
		normal! h<cr>
	endif
	normal! v
	call search("[,(]", "b")
	normal! l
endfunction
" }}}
" Functions for tabulating --------------{{{
function! Mozilla()
	setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
endfunction

function! DetectMozilla()
	let l:moz_path = '/home/andrea/firefox_builds/mozilla-central/'
 	let l:path = strpart(expand('%:p'), 0, strlen(l:moz_path))
	if l:path ==# l:moz_path
		call Mozilla()
		echom "Mozilla file detected"
	endif
endfunction

function! Python()
	setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
endfunction
" }}}
" Vimscript folding -----------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup filetype_mozilla
 	autocmd!
	autocmd BufReadPre * :call DetectMozilla()
augroup END
" }}}
