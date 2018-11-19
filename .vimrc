filetype on
filetype plugin on
filetype plugin indent on

set nocompatible      " use vim defaults
set encoding=utf-8    " use utf-8
set ls=2              " always show status line
set scrolloff=4       " keep 4 lines when scrolling
set showcmd           " display incomplete commands
set hlsearch          " highlight searches
set incsearch         " do incremental searching
set ruler             " show the cursor position
set visualbell t_vb=  " turn off error beep/flash
set novisualbell      " turn off visual bell
set number            " show line numbers
set ignorecase        " ignore case when searching
set smartcase         " no ignorecase if Uppercase char present
set smarttab          " tab and backspace are smart
set title             " show title (console)
set titleold=         " reset the title at exit
set titlestring=Vim:\ %F
set t_Co=256          " set 256 colors
set ttyfast           " smoother change
set modeline          " last line in document sets vim mode
set modelines=5       " number of lines checked for modelines
set shortmess=atI     " abbreviate messages
set nohidden          " when tab is closed, remove the buffer
set nostartofline     " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set mouse=a           " mouse support
set wildmenu          " completion menu
set showmatch         " Show matching brackets
set cursorline        " Highlight current line
set backspace=indent,eol,start  " make that backspace key work the way it should
set tabstop=4         " number of space of the tab character
set shiftwidth=4      " number of space of (auto)indent
"set autoindent        " always set autoindenting on
"set smartindent       " smart indentation
set noautoindent
set nosmartindent
set cindent           " C indentation
set expandtab         " tabs are converted to spaces
set sm                " show matching braces
set nowrap            " don't wrap lines
set wildignore=*.swp,*.bak,*.pyc
set list listchars=tab:→\ ,trail:.
set nobackup          " do not keep a backup file, use versionning instead
set showmode

" Fold settings
set foldmethod=syntax
set foldcolumn=0
set foldenable

" Enable / Disable the paste mode
nnoremap ,p :set invpaste paste?<CR>
set pastetoggle=,p

" Enable / Disable the spell mode
nnoremap ,s :set invspell spell?<CR>

" Turn off hightlighted search
nnoremap ,h :silent noh<CR>

" Open the shell
nnoremap ,t :shell<CR>

" Enable / Disable line numbering
nnoremap ,l :set invnumber nonu?<CR>

" Enter validates completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Ctags definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Fast window resizing
nmap <S-Down> :res +5<CR>
nmap <S-Up> :res -5<CR>
nmap <S-Left> <C-W>5<
nmap <S-Right> <C-W>5>

nmap <Space> <PageDown>
cmap tb tabnew

" Quick fix mappings
nmap [q :cp<CR>
nmap ]q :cn<CR>

" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Unfold by default
au BufWinEnter * normal zR

" Activate some language indentation
au FileType python  set  autoindent
au FileType c       setl sw=8 ts=8 sts=4
au FileType cpp     setl sw=4 ts=4 sts=2
au FileType sh      let g:sh_fold_enabled=5
au FileType sh      let g:is_bash=1

" Avoid boost autocompletion
set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!

" Syntax highlighting
syntax on

""""""""""""""""""""""""" PLUGINS SETTINGS """""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-abolish'
Plug 'libclang-vim/clang-type-inspector.vim' | Plug 'rhysd/libclang-vim', { 'for': ['cpp'] }
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/clibs.vim'
call plug#end()

colorscheme jellybeans " color scheme
set background=dark    " adapt colors for background

" Extra whitespaces
au ColorScheme * highlight ExtraWhitespace
au BufEnter    * match     ExtraWhitespace /\s\+$/
au InsertEnter * match     ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match     ExtraWhiteSpace /\s\+$/
highlight ExtraWhitespace ctermbg=red

" GitGlutter
highlight SignColumn ctermbg=none

" TagBar
nmap ,q :TagbarToggle<CR>

" NERDTree
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks") " store the bookmarks file
let NERDTreeShowBookmarks=1       " show the bookmarks table on startup
let NERDTreeShowFiles=1           " show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " highlight the selected entry in the tree
let NERDTreeMouseMode=2           " use a single click to fold/unfold directories and a double click to open files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.swp$' ] " don't display these kinds of files

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = '[RO]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Glibc functions
let c_hi_identifiers = 'all'
let c_hi_libs = ['*']

" Clang auto inspector
let g:clang_type_inspector#automatic_inspection=0
augroup clang-inspect-type-mapping
    autocmd!
    autocmd FileType cpp nmap <C-i> <Plug>(clang-inspect-type-at-cursor)
augroup END

