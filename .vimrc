" Installing vimballs
" open it in vim and type :source %

" For powerline
set encoding=utf-8
let g:Powerline_symbols = 'unicode'

" Makes the mapleader not so crappy.
let mapleader = ","

" Enable filetype specific configuration by placing files into
" ftplugin/{js,py,rb,etc}.vim
filetype on

" Note: for making terminal colors work in OSX:
" http://stackoverflow.com/questions/3761770/iterm-vim-colorscheme-not-working

" INDENTATION
set ai
set ts=2 
set sts=2 
set sw=2
"set mouse=a
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

" Toggle syntax numbering
function! ToggleNumber()
    if(&relativenumber)
        set number
    else
        set relativenumber
    endif
endfunction
nmap <silent><leader>l :call ToggleNumber()<CR>

" Toggle paste mode
function! TogglePaste()
    if(&paste)
        set nopaste
    else
        set paste
    endif
endfunction
nmap <silent><leader>p :call TogglePaste()<CR>

" Shift tab dedent
nnoremap <s-tab> <<

" Quit with ,q
nmap <silent> <leader>q :q<CR>

" Map omnicompletion to jk 
inoremap jk <c-x><c-o>

" Markdown heading generation
nnoremap <leader>H yyp :s/./#/<cr> :noh<cr>
" Subheading
nnoremap <leader>sH yyp :s/./-/<cr> :noh<cr>

" Execute line under cursor - useful when editing these damn things.
nnoremap <leader>e yy :<c-r>"<cr>k

" Bufsurf forward and back in history
nnoremap <leader>a :BufSurfBack<CR>
nnoremap <leader>s :BufSurfForward<CR>

" Change paste "_ sets buffer to blackhole buffer, <C-R> loads register contents.
" We assume the default register.
nmap <silent> cp "_cw<C-R>"<Esc>

" Add php highlighting to Phakefiles
au BufNewFile,BufRead Phakefile set filetype=php
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" Disable numbering for easier copy and paste
" mnemonic: mouse disable
nnoremap <leader>md :set mouse=r<cr> :set nonumber<cr> :set norelativenumber<cr> 
" mnemonic: mouse visual
nnoremap <leader>mv :set mouse=a<cr> :set relativenumber<cr>

" mouse all
nnoremap <leader>ma :set mouse=a<cr>
" mouse none
nnoremap <leader>mn :set mouse=r<cr>

" Rainbow paren
nnoremap <leader>R :RainbowParenthesesToggle<cr>

" Change variable to object notation for php
nnoremap <leader>vo mZ viW :s/\v\$(.*)\[\'(.*)\'\]/$\1->\2/ <cr><esc>`Z:noh<cr>
" Change variable to array notation for php
nnoremap <leader>va mZ viW :s/\v\$([^\ \=]*)-\>([^\ \=]*)/$\1['\2']/ <cr><esc>`Z:noh<cr>
" ca is used in nerdcommenter for chaning comment tupes.
