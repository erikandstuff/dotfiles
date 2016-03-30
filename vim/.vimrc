" Plugins ----------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': 'PATH=~/opt/cmake/bin:$PATH ./install.py --clang-completer --tern-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'haya14busa/incsearch.vim'
Plug 'Raimondi/delimitMate'
Plug 'edsono/vim-matchit'
Plug 'alvan/vim-closetag'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
filetype plugin indent on
call plug#end()


" Look and feel ----------------------------------------------

" enable syntax highlighting (solarized)
syntax enable
set background=dark
colorscheme solarized

" enable filetype detection
filetype on
filetype plugin on
filetype indent on

set encoding=utf-8    " utf8 by default for new files
set nocompatible      " it's not 1985
set nobackup          " don't create ~backup files (persistent undo enabled)
set number            " show line numbers
set nowrap            " disable wrapping
set cursorline        " highlight current line
set ttyfast           " improve scrolling speed
set lazyredraw
set foldlevelstart=99 " unfold everything by default
set noerrorbells      " disable bell/flash
set history=1000      " command history length
set so=10             " horizontal scrollover
set backspace=2       " make backspace work normally
set tabpagemax=15     " max 15 tabs open
set laststatus=2      " always display statusbar
set previewheight=3  " maximum height for preview window
set showmatch         " highlight matching brace
set noshowmode        " hide -INSERT- notification
set updatetime=750    " improve latency for plugins
set showcmd           " show commands as they're being input
set autoread          " automatically reload when changed externally

set hlsearch          " highlight all search matches
set incsearch         " start searching before hitting 'enter'
set ignorecase        " perform case-insensitive search
set smartcase         " ...unless search term has a capital letter

set hidden            " hide buffers instead of closing them
set undofile          " persistent undo
set undodir=$HOME/.local/share/vim/undo

set wildmenu          " autocomplete for command menu
set completeopt=menu,menuone,longest,preview

" disable menubar, toolbar, etc
set guioptions-=T
set guioptions-=e
set guioptions-=r
set guioptions-=m
set guifont=Menlo\ for\ Powerline:11


" Tab behavior ---------------------------------------------------------
set smartindent     " autoindent
set expandtab       " replace hard tabs with spaces
set shiftwidth=2    " tab width = 3 spaces
set tabstop=2
set softtabstop=2
au FileType python setl expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Keybindings ----------------------------------------------------------
set pastetoggle=<F2> " F2 to toggle paste mode

" re-wrap paragraphs
nnoremap <leader>q gqip

" Re-indent file, keeping cursor position
map <leader>= mzgg=G`z<CR>

" :W! to write to a file using sudo
cmap W! %!sudo tee > /dev/null %

" switch buffers with H and L
noremap H :bp<CR>
noremap L :bn<CR>

" move up/down on a wrapped line with j and k
nnoremap j gj
nnoremap k gk

" do things right
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" clear search highlight with \<space>
nnoremap <leader><space> :noh<cr>

" no one ever hits F1 on purpose
noremap <F1> <ESC>

" switch to normal mode with jj
inoremap jj <ESC>


" Plugin Config ----------------------------------------------------------
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:delimitMate_expand_cr = 2
let g:delimitMate_jump_expansion=1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1

let g:airline_powerline_fonts = 1

let g:closetag_html_style=1

let g:ctrlp_clear_cache_on_exit = 0
let g:netrw_liststyle = 3
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <c-p> :FZF<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMinimalUI=1
map <silent> <C-n> :NERDTreeToggle<CR>
