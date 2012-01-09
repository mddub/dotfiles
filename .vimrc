let mapleader = ","

set nocompatible
set mouse=a

" Filetype highlighting
filetype plugin indent on
syntax on

" Show what you are typing mid-command
set showcmd

" Indentation/tabs
set autoindent
set noexpandtab " in python, use real tabs

" 4 spaces by default
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlight trailing whitespace and non-tab indents
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /^\t*\zs \+/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

" Color scheme and font
set t_Co=256
colorscheme xoria256
set guifont=Monaco:h12

" Highlight current line
set cursorline

" Statusline
set laststatus=2 " Show statusline even when there is a single window
set statusline=%F%m%r%h%w%{fugitive#statusline()}
set statusline+=[%l,%v][%p%%]

" Maintain more text around the cursor
set scrolloff=3

" Show line numbers
set number

" Backspace config
set backspace=eol,start,indent

" Hidden buffer support
set hidden

" Disable annoying messages, swap file already exists
set autoread
set shortmess+=IA

" Longer history
set history=1000

" Case-smart searching (case-sensitive only if capital letter in search)
set ignorecase
set smartcase

" Tab completion
set wildmode=longest,list

" Visual bell instead of beep
set visualbell

" keep backups and temp files in ~.vim/
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" set default split opening position to be below and to the right of currently active split
set splitbelow
set splitright

" Tags - recursively check parent directories for tags file
set tags+=./.tags,.tags,../.tags,../../.tags

" ---------- plugin settings ---------

" Syntastic
let g:syntastic_auto_loc_list=1

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

" Ropevim
if(match(hostname(), 'dev20') >= 0)
	let ropevim_vim_completion=1 "Replace vim's complete function with ropevim
	let ropevim_extended_complete=1
endif

" ---------- mappings ---------

" jj = escape
inoremap jj <ESC>
inoremap JJ <ESC>

" Typos and things I don't want to do
nmap Q <ESC>
nmap :Q :q
nmap :W :w
nmap :WQ :wq

" Windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Function key shortcuts
map <F1> <nop>
map <F3> :set hlsearch! hlsearch?<CR>
map <F6> :NERDTreeClose<CR>
map <F7> :NERDTreeFind<CR> "TODO combine with F6 to make toggle
map <F8> :TagbarToggle<cr>
map <F9> :!/usr/bin/ctags -L <(find . -name '*.py') --fields=+iaS --python-kinds=-i --sort=yes --extra=+q<cr>

" Leader shortcuts
map <Leader>v :tabe ~/.vimrc<CR>
map <Leader>e :tabe 
map <Leader>E :e <C-R>=expand('%:p:h') . '/'<CR>
map <Leader>s :tab split<CR>	" Open current buffer in new tab
map <Leader>n :tabnew<CR>
map <Leader>Q :tabc<CR>
map <Leader>m :tabm
map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>l :lclose<CR>
map <Leader>L :lopen<CR>
map <Leader>c :copen<CR>
map <Leader>C :cclose<CR>
map <Leader>z :cp<CR>
map <Leader>x :cn<CR>
map <Leader>f :tab split<CR>:Gdiff canon/master<CR>	" git diff in new tab
map <Leader>g :tab split<CR>:Ggrep 
map <Leader>i Oimport pdb; pdb.set_trace()<ESC>

" ---------- yelp stuff ---------

if(match(hostname(), 'dev20') >= 0)
	map <Leader>t :!cd ~/pg/yelp-main/templates && make<CR>
	autocmd BufEnter *.css.tmpl setlocal filetype=css
	autocmd BufEnter *.js.tmpl setlocal filetype=javascript
endif
