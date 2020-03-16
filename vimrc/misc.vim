" =============================================================================
" File:  misc.vim
" Description: Misc configuration
" =============================================================================

" Allow plugins by file type
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" =============================================================================
" Section: Configure shell
" =============================================================================

" Use login shell for a proper environment
set shell=bash\ -l
let $PATH=system('echo $PATH')

" =============================================================================
" Section: Configure tabs and space handling
" =============================================================================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Linebreak on 120 characters
set linebreak
set textwidth=120

" Copy indent from current line when starting a new line, but be smart
set autoindent
set smartindent

" Wrap lines when longer than window width
set wrap

" =============================================================================
" Section: Configure search
" =============================================================================

" Set case-insensitive search
set ignorecase

" Ignore case only if pattern consist of lower case letters only
set smartcase

" Set incremental search
set incsearch

" Set highlighted search results
set hlsearch

" =============================================================================
" Section: Configure directories
" =============================================================================

" Set swap directory
if !isdirectory("~/.vim/swap")
  silent !mkdir -p ~/.vim/swap
endif
set directory=~/.vim/swap

" Set backup directory
if !isdirectory("~/.vim/backup")
  silent !mkdir -p ~/.vim/backup
endif
set backupdir=~/.vim/backup
set backup

" Set undo directory
if !isdirectory("~/.vim/undo")
  silent !mkdir -p ~/.vim/undo
endif
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" =============================================================================
" Section: Configure folding
" =============================================================================

" Set fold method based on indent
set foldmethod=indent

" Set deepest fold level to 10
set foldnestmax=10

" Do not fold by default
set nofoldenable

" Set fold level to 1
set foldlevel=1

" =============================================================================
" Section: Configure visual style
" =============================================================================

" Set line numbers
set nu

" Highlight current line
set cursorline

" Keep cursor 3 lines away from screen border when scrolling
set scrolloff=3

" Always show status bar
set laststatus=2

" Get rid of -- INSERT --. It is displayed in the statusline
set noshowmode

" Always show tabline
set showtabline=2

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable syntax highlighting
syntax on

" Set color sheme to 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
  colorscheme wombat256mod
else
  colorscheme wombat
endif
set background=dark

if has('gui_running')
  set t_Co=256
  set guitablabel=%M\ %t
else
  " Only display filename for tab caption
  set guitablabel=%t
endif

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmenu
set wildmode=list:longest

" enable better behavior for showing long lines
set display=lastline

" Turn on listing non-text chars
set list listchars=tab:»·,trail:·,eol:$

" Max Line-Width Highlighting (Vim >= 7.3)
if version >= 703
    set colorcolumn=120
    hi ColorColumn ctermbg=233 guibg=#1A1A1A
endif

" Change cursor shape in different modes - Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" enable terminal mouse support
set mouse=a

" enable over line end selection
"set ve=all

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Delete trailing white space on save, useful for some filetypes ;)
function! TrimWhiteSpace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.md,*.cpp,*.h,*.hpp,*.c,*.mk,*.vim :call TrimWhiteSpace()
endif


