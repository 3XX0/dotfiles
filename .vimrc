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

" Set cursor modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Fold settings
set foldmethod=syntax
set foldcolumn=0
set foldenable

" Fixups
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap Y y$

" Enable / Disable the paste mode
nnoremap ,p :set invpaste paste?<CR>
set pastetoggle=,p

" Enable / Disable the spell mode
nnoremap ,s :set invspell spell?<CR>

" Turn off hightlighted search
nnoremap ,h :silent noh<CR>

" Enable / Disable line numbering
nnoremap ,l :set invnumber nonu?<CR>

" Enter validates completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Ctags definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open the shell
nnoremap <C-@> :vert term<CR>

" Fast window resizing
nmap <S-Down> :res +5<CR>
nmap <S-Up> :res -5<CR>
nmap <S-Left> <C-W>5<
nmap <S-Right> <C-W>5>

cnoremap tb tabnew
cnoremap su w !sudo tee %

nmap <Space> <PageDown>
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprev<CR>

" Quick fix mappings
nmap [q :cp<CR>
nmap ]q :cn<CR>

" Grep under the cursor
nnoremap gr :silent grep! -srnw --binary-files=without-match --exclude-dir=.git <cword> *<CR>:redr!<CR>:cw<CR>
nnoremap Gr :silent grep! -srn --binary-files=without-match --exclude-dir=.git <cword> *<CR>:redr!<CR>:cw<CR>
nnoremap gR :silent grep! -srnw --binary-files=without-match --exclude-dir=.git <cword> %:p:h/*<CR>:redr!<CR>:cw<CR>
nnoremap GR :silent grep! -srnw --binary-files=without-match --exclude-dir=.git <cword> %:p:h/*<CR>:redr!<CR>:cw<CR>

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
au FileType sh      set foldmethod=indent

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
Plug 'tpope/vim-abolish'
Plug 'romainl/apprentice'
Plug 'libclang-vim/clang-type-inspector.vim' | Plug 'rhysd/libclang-vim', { 'for': ['cpp'] }
Plug 'vim-scripts/clibs.vim'
Plug 'rust-lang/rust.vim'
call plug#end()

function! MyHighlights() abort
    highlight Normal ctermbg=234
endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme apprentice " color scheme

" Extra whitespaces
au ColorScheme * highlight ExtraWhitespace
au BufEnter    * match     ExtraWhitespace /\s\+$/
au InsertEnter * match     ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match     ExtraWhiteSpace /\s\+$/
highlight ExtraWhitespace ctermbg=131

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

" Glibc functions
let c_hi_identifiers = 'all'
let c_hi_libs = ['*']

" Clang auto inspector
let g:clang_type_inspector#automatic_inspection=0
augroup clang-inspect-type-mapping
    autocmd!
    autocmd FileType cpp nmap <C-i> <Plug>(clang-inspect-type-at-cursor)
augroup END

" Rust
let g:rustfmt_autosave = 1
