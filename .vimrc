" Makes the mapleader not so crappy.
let mapleader = ","

" Note: for making terminal colors work in OSX:
" http://stackoverflow.com/questions/3761770/iterm-vim-colorscheme-not-working

" INDENTATION
set ai
set ts=4 
set sts=4 
set sw=4
set mouse=a
set number
set hidden
set expandtab
syntax reset
syntax on
colorscheme molokai
call pathogen#infect()
filetype plugin indent on
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

"http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %
set backspace=indent,eol,start
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Toggle NERDTree with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>r :NERDTreeFind<CR>
" Get rid of stuff that makes VIM vi compatible that is apparrently crappy?
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
set nocompatible
" Security fix
set modelines=0

set ruler
set showmode
set showcmd
set visualbell
set cursorline
set ttyfast
set laststatus=2
" Relative numbering instead of line numbering, use the ruler instead for
" absolute.
silent! set relativenumber
" Creates an undofile that lets you conduct undoes after close and reopen.
silent! set undofile
" Makes searching better
set ignorecase
" Overrides ignorecase if uppercase characters are used in a search.
set smartcase
" Global substitution on by default. g now reverts to single sub.
set gdefault
" Starts to highlight partial search results.
set incsearch
" Briefy jump to matching closing brackets.
" set showmatch super annoying
set hlsearch
" Use perl style regex instead of vims goofiness
nnoremap / /\v
vnoremap / /\v
" Clear highlights from incsearch. using ,<space>
nnoremap <leader><space> :noh<cr>

" Column wrapping
set wrap
set textwidth=79
" See :help fo-table
set formatoptions=qrn1
silent! set colorcolumn=85

" Automatically save current editor after tabbing away.
" au FocusLost * :wa
"
nmap <silent><leader>f <c-p>
