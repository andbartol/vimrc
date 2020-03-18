" vim-plug -----------------------------{{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
"Plug 'hsanson/vim-android'
"Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
"Plug 'vim-scripts/AutoComplPop'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'terryma/vim-expand-region'
"Plug 'bkad/CamelCaseMotion'
Plug 'EinfachToll/DidYouMean'
Plug 'haya14busa/incsearch.vim'
Plug 'takac/vim-hardtime'
Plug 'jpalardy/vim-slime'
"Plug 'vim-scripts/Vim-JDE'
Plug 'vim-scripts/Conque-Shell'
"Plug 'anddam/android-javacomplete'
Plug 'kenyth/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'NLKNguyen/papercolor-theme'
"Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/indexer.tar.gz'
"Plug 'vim-scripts/javacomplete'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'tpope/vim-fugitive'
Plug 'osyo-manga/vim-over'
Plug 'edsono/vim-matchit'
"Plug 'scrooloose/syntastic'
Plug 'rstacruz/sparkup'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'derekwyatt/vim-scala'
Plug 'eagletmt/neco-ghc'
"Plug 'Shougo/neocomplete.vim'
Plug 'Scuilion/gradle-syntastic-plugin'
Plug 'digitaltoad/vim-pug'
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-eunuch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'posva/vim-vue'
"Plug 'dense-analysis/ale'
call plug#end()
" }}}
" Autocmds -----------------------------{{{
aug tutto
	autocmd!
	"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	"au InsertLeave * match ExtraWhitespace /\s\+$/
	"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd! bufwritepost .vimrc source %
	autocmd FileType python :call Python()
	autocmd FileType php :call Python()
	autocmd FileType vue :call Mozilla()
	autocmd FileType blade :call Mozilla()
	autocmd FileType js :call Python()
	autocmd FileType cpp :call Mozilla()
	autocmd FileType pug :call Mozilla()
	autocmd FileType haskell :call Haskell()
	autocmd FileType ruby :call Ruby()
	autocmd FileType eruby :call Ruby()
	autocmd FileType tex :call Tex()
	autocmd Filetype blade :SnipMateLoadScope html
	autocmd CursorHold * silent call CocActionAsync('highlight')
	"autocmd FileType java setlocal omnifunc=javacomplete#Complete
	"autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
aug END
" }}}
" Settings --------------------------{{{
"set term=screen-256color
let g:miniBufExplMapCTabSwitchBufs = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:android_sdk_path = '~/android-studio/sdk/'
let g:airline#extensions#tabline#enabled = 0
"set guifont="Source Code Pro Medium 10"
set guifont=Operator\ Mono\ Semi-Light\ 10

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
"set omnifunc=syntaxcomplete#Complete
set backspace=2
set clipboard=unnamed
set hlsearch
set laststatus=2
set nobackup
set noswapfile
set nowritebackup
set number
set relativenumber
set ruler
set showcmd
set tags=/home/andrea/.vim/tags/st1
set tags+=tags
set wildmenu
set hidden
set cursorline
"hi cursorline cterm=none term=none
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
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
let g:haskellmode_completion_ghc = 1
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
set rtp+=~/.fzf
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:tex_flavor='latex'
set mouse=a
" }}}
" Key Mapping -------------------------------{{{
"inoremap cc <esc>Vyp
nnoremap <Leader>s :SyntasticToggleMode<CR>
nnoremap <Leader>co :silent !rm lenti.aux && latex lenti.tex && divpdf lenti.dvi<cr>
nnoremap <leader>t :TlistToggle<cr>
nnoremap <c-c> <c-w><c-w><c-f><c-w><c-w>
nnoremap <cr><cr> o<esc>
inoremap <c-d> <esc>ddi
"inoremap <c-x> <esc><c-r>i
inoremap <c-z> <esc>ui
inoremap <esc> <nop>
map <space> <leader>
inoremap jk <esc>
nnoremap <c-h> <c-w>h
nnoremap <C-j> <C-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-w>t :tabnew<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>v V
nnoremap <leader>b :<c-u>execute "b" . v:count1<cr>
nnoremap \ /
"nnoremap @q :q<CR>
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
"nnoremap <c-m> u.
nnoremap <c-s> :OverCommandLine<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
onoremap i, :call SelectArgument()<cr>
vnoremap < <gv
vnoremap > >gv
map <Leader> <Plug>(easymotion-prefix)
vnoremap <leader>q :normal @q<cr>
nnoremap <leader>q :q<cr>
vnoremap <c-s> :OverCommandLine<cr>s/
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward
nnoremap <c-p> :Files<cr>
nnoremap <c-i> :Buffers<cr>
"nnoremap <c-l> yiw:Ag <c-r>"<cr>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>d :bd<cr>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap zt 2kzt2j

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"imap <s-tab> <Plug>snipMateNextOrTrigger

" vib per selezionare un blocco dentro le parentesi
" vi" o vi' per scrivere dentro le virgolette più vicine
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
" }}}
" coc.nvim -----------------------------{{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
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
function! Tex()
	set filetype=tex
	nnoremap <leader>co :!./compila.sh<cr>
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

function! Haskell()
	setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4 shiftround
endfunction

function! Ruby()
	setlocal tabstop=2 expandtab softtabstop=2 shiftwidth=2 shiftround
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
