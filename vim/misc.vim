" =============================================================================
" File:  misc.vim
" Description: Misc configuration
" =============================================================================

" Allow plugins by file type
filetype plugin on
filetype indent on

" =============================================================================
" Section: Configure shell
" =============================================================================

" Use login shell for a proper environment
set shell=bash\ -l
let $PATH=system('echo $PATH')

" =============================================================================
" Section: Configure tabs and space handling
" =============================================================================

" Set tabs and space handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" =============================================================================
" Section: Configure search
" =============================================================================

" Set case-insensitive search
set ic

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

" Only display filename for tab caption
set guitablabel=%t

" enable terminal mouse support
set mouse=a

" enable over line end selection
"set ve=all


" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" substitute these typos for what I DWIM'd
"cabbrev W w
"cabbrev Wq wq
"cabbrev Q q

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

endif

" =============================================================================
" Section: Configure folding
" =============================================================================

" Set fold method based on indent
set foldmethod=indent

" Set deepest fold to 10 levels
set foldnestmax=10

" Do not fold by default
set nofoldenable

" This is just what i use
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

" Enable syntax highlighting
syntax on

" Set color sheme to 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
  colorscheme wombat256mod
else
  colorscheme wombat
endif

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" enable better behavior for showing long lines
set display=lastline

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
let g:Powerline_symbols = 'fancy'

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

