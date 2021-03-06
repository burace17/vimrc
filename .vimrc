syntax on
set nocompatible ruler laststatus=2 showcmd showmode number
set incsearch ignorecase smartcase hlsearch wildmenu cmdheight=2 
set background=dark showmatch shiftwidth=4 noexpandtab tabstop=4 t_Co=256
set guifont=Monospace\ 12

" Pathogen
call pathogen#infect()
colorscheme badwolf
" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate' " Automatically close quotes, parens, brackets, etc.
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'jelera/vim-javascript-syntax' " Better JS Syntax
Plugin 'tomtom/tcomment_vim' " comment out shortcut
Plugin 'flazz/vim-colorschemes' " A bunch of color schemes
Plugin 'Valloric/YouCompleteMe'
Plugin 'wlangstroth/vim-racket'
call vundle#end()
filetype plugin indent on
" ------------------

let mapleader=","
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors=1
let g:syntastic_enable_racket_racket_checker=1
let g:ycm_global_ycm_extra_conf='~/.ycm_global_ycm_extra_conf.py'
let g:EclimCompletionMethod = 'omnifunc'

" Status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ 
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Drag visuals plugin
runtime plugin/dragvisuals.vim
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
let g:DVB_TrimWS = 1


" Key Mappings
" CTRL+S = Save (insert mode)
imap <C-S> <Esc>:w<CR>a
imap <C-S> <Esc><C-S>
" Leader+s = save (normal mode) 
nmap <Leader>s :w<CR>
nmap <F9> :e $HOME/.vimrc<CR> " Edit .vimrc
nmap <Leader>t :NERDTree<CR> " Show file tree
nmap <Leader>x :x<CR> " Save and exit
nmap <Leader>z ZZ " Save and exit window
nmap <Leader>q ZQ " Quit without saving
nmap <Leader>ww <C-W>w " Switch windows
nmap <Leader>ws <C-W>s " Split window horizontally
nmap <Leader>wv <C-W>v " Split window vertically
nmap <Leader>wq <C-W>q " Close window
nmap <Leader>c :TComment<CR> " Comment out line
vmap <Leader>v :TCommentBlock<CR> " Comment out block
imap `` <Esc> " Exit insert mode easier
