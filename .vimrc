" Vundle settings ----------------------------{{{
set nocompatible              " be iMproved, required
filetype off                  " required
let g:glowshi_ft_no_default_key_mappings = "1"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
"Plugin 'hsanson/vim-android'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'terryma/vim-expand-region'
"Plugin 'bkad/CamelCaseMotion'
Plugin 'EinfachToll/DidYouMean'
Plugin 'haya14busa/incsearch.vim'
Plugin 'takac/vim-hardtime'
Plugin 'jpalardy/vim-slime'
"Plugin 'vim-scripts/Vim-JDE'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'anddam/android-javacomplete'
Plugin 'kenyth/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/javacomplete'
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
Plugin 'tpope/vim-fugitive'
Plugin 'osyo-manga/vim-over'

Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/syntastic'
Plugin 'rstacruz/sparkup'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'derekwyatt/vim-scala'
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
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
aug END
" }}}
" Settings --------------------------{{{
let g:miniBufExplMapCTabSwitchBufs = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:android_sdk_path = '~/android-studio/sdk/'
let g:airline#extensions#tabline#enabled = 1

let $CLASSPATH = '/home/andrea/Android/Sdk/platforms/android-22/android.jar'

let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 1

let NERDTreeWinPos = 'right'
"let g:airline_theme = 'light'
"let g:android_sdk_tags = '~/android-studio/sdk/tags/tags'
"set tags=/home/andrea/.vim/tags/tags
"colorscheme autumn
"colorscheme badwolf
set t_Co=256
set guioptions=aPcg
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
filetype indent on
filetype on
filetype plugin on
let mapleader=","
map <C-Tab> <Tab>
set omnifunc=syntaxcomplete#Complete
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
set tags=/home/andrea/.vim/tags/st1
set tags+=tags
set wildmenu
set hidden
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
" highlight
let g:glowshi_ft_selected_hl_link = 'Cursor'
let g:glowshi_ft_candidates_hl_link = 'Error'
" timeout
let g:glowshi_ft_timeoutlen = 2000
let g:airline#extensions#branch#enabled = 1
syntax enable
" }}}
" Key Mapping -------------------------------{{{
"inoremap cc <esc>Vyp
nnoremap <leader>t :TlistToggle<cr>
nnoremap <c-c> <c-w><c-w><c-f><c-w><c-w>
nnoremap <cr><cr> o<esc>
inoremap <c-d> <esc>ddi
"inoremap <c-x> <esc><c-r>i
inoremap <c-z> <esc>ui
inoremap <esc> <nop>
map <space> <leader>
inoremap jk <esc>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nnoremap <c-w>t :tabnew<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>v V
nnoremap <leader>b :<c-u>execute "b" . v:count1<cr>
nnoremap \ /
nnoremap <leader>q :q<CR>
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <leader>j :<c-u>execute "normal! " . v:count1*10 . "j"<cr>
nnoremap <leader>k :<c-u>execute "normal! " . v:count1*10 . "k"<cr>
nnoremap N Nzz
nnoremap n nzz
nnoremap . :
nnoremap : .
nnoremap cd :<C-U>execute "normal! Vy" . v:count1 . "p"<CR>
nnoremap <c-n> :noh<CR>
nnoremap <leader>w :w<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>p :b#<cr>
nnoremap <leader><leader>p :bn<cr>
nnoremap <c-m> u.
nnoremap <c-s> :OverCommandLine<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
onoremap i, :call SelectArgument()<cr>
vnoremap < <gv
vnoremap > >gv
vnoremap <leader>q :normal @q<cr>
vnoremap <c-s> :OverCommandLine<cr>s/
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>d :bd<cr>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
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

function! ForceSave()
	w !sudo tee > /dev/null %
endfunction
command! ForceSave call ForceSave()
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
