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
set tags=/home/andrea/vim/src/vimtags
set tags+=/home/andrea/.vim/tags/st1
filetype on
filetype plugin on
filetype indent on
syntax enable
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme badwolf
set hlsearch
map <C-Tab> <Tab>
set ruler
set number
set clipboard=unnamed
set backspace=2
set t_Co=256
set nobackup
set nowritebackup
set noswapfile
let mapleader=","
set laststatus=2
set showcmd
set foldlevelstart=0
" }}}
" Key Mapping -------------------------------{{{
nnoremap <c-m> :noh<CR>
inoremap <c-d> <esc>ddi
nnoremap <c-s> :w<CR>
inoremap <c-s> <esc>:w<CR>a
vnoremap <c-s> <esc>:w<CR>v
inoremap <c-z> <esc>ui
inoremap <c-x> <esc><c-r>i
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU<esc>
nnoremap cd :<C-U>execute "normal! Vy" . v:count1 . "p"<CR>
inoremap <c-c> <esc>cdi
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap jk <esc>
inoremap <esc> <nop>
onoremap p i(
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
iabbrev return USAABBREVIAZIONE
iabbrev rett return
onoremap in( :<c-u>normal! f(vi(<cr
"inoremap cc <esc>Vyp
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
nmap <leader>m :tabn<CR>
nmap <leader>n :tabp<CR>
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
" Functions for tabulating --------------{{{
function! Mozilla()
	set tabstop=2 expandtab shiftwidth=2 softtabstop=2
endfunction

function! Python()
	set tabstop=4 expandtab shiftwidth=4 softtabstop=4
endfunction
" }}}
" Vimscript folding -----------------------{{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Autocmds -----------------------------{{{
aug tutto
	autocmd!
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd! bufwritepost .vimrc source %
	autocmd FileType python :call Python()
aug END
" }}}
