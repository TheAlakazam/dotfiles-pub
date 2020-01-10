if &compatible
  set nocompatible
endif

let mapleader="\<SPACE>"

set termguicolors
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set relativenumber      " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set guifont=Fira\ Code:h11
set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set updatetime=250
set background=dark

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set smartindent
set autoindent
set completeopt -=preview

set tags+=~/.nvim/tags/stl
set undodir=~/.nvim/undodir
set undofile
"Custom Keybindings

"Getting term in a new split
nnoremap <leader>o :Term<CR>
"Opening config file
nnoremap <leader>e :e $MYVIMRC<CR>
"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Autocompilation on pressing F4
autocmd filetype python nnoremap <F4> :Term python #<CR>
"autocmd filetype cpp nnoremap<F4> :!g++ % -o %:r.out && grep -oP '\/\/input: \K.*(?=\/\/)' % \| ./%:r.out <CR>
autocmd filetype cpp nnoremap <F8> :!g++ -std=c++11 % -o %:r.out<CR>
autocmd filetype cpp nnoremap <F9> :20Term "./#:r.out"<CR>
"Use buffers instead of tabs
nmap <leader>t :enew<cr> " To open a new empty buffer
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
nmap <leader>bl :ls<cr>
"Reload init.vim
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
"Use leader leader to remove highlight from search
nnoremap <leader><leader> :nohlsearch<CR>
let g:python3_host_prog='/usr/bin/python3'
call plug#begin('~/.nvim/plugged')
"Utilites
Plug 'vimlab/split-term.vim'
Plug 'thaerkh/vim-workspace'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
"Web Development
Plug 'mattn/emmet-vim'
"Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"Theme Stuff
Plug 'vim-airline/vim-airline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
call plug#end()
"Deoplete Stuff
let g:deoplete#enable_at_startup = 1
"use TAB as the mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ?  "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort ""     
  let col = col(.) - 1
  return !col || getline(.)[col - 1]  =~ s
endfunction ""   
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

map <leader>a :NERDTreeToggle<CR>
"Theme Stuff
colorscheme palenight
"Airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme= 'palenight'

