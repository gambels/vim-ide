" =============================================================================
" File: plugins.vim
" Description: Plugin configuration
" =============================================================================

" =============================================================================
" Section: Minimal package manager
" =============================================================================

function! PackInit() abort
  packadd minpac

  if exists('g:loaded_minpac')
    " Initialize minpac
    call minpac#init({'verbose': '3'})

    " Minimal package manager
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " A tree explorer plugin for vim.
    call minpac#add('scrooloose/nerdtree')
    " A command-line fuzzy finder
    call minpac#add('junegunn/fzf',{'do': 'call fzf#install()'})
    " lean & mean status/tabline for vim that's light as air
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    " A Git wrapper so awesome, it should be illegal
    call minpac#add('tpope/vim-fugitive')
    " A class outline viewer for Vim
    call minpac#add('majutsushi/tagbar')
    " A code-completion engine for Vim
    call minpac#add('ycm-core/YouCompleteMe',{'do': {-> system('./install.py --clangd-completer')}})
    " Cosmetics
    call minpac#add('vim-scripts/Wombat')
    call minpac#add('vim-scripts/wombat256.vim')
  else
    echoerr "minpac is not available"
    cq
  endif

endfunction

" =============================================================================
" Section: k-takata/minpac
" =============================================================================

" Define minpac user commands
command! PackUpdate  call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean   call PackInit() | call minpac#clean()
command! PackStatus  call PackInit() | call minpac#status()
command! PackInstall call PackInit() | call minpac#update('', {'do': 'quit'})

" =============================================================================
" Section: scrooloose/nerdtree
" =============================================================================

let NERDChristmasTree = 1
let NERDTreeShowHidden = 0

" =============================================================================
" Section: junegunn/fzf
" =============================================================================

" =============================================================================
" Section: majutsushi/tagbar
" =============================================================================

" Set autofocus on Tagbar open
"let g:tagbar_autofocus = 1

" =============================================================================
" Section: ycm-core/YouCompleteMe
" =============================================================================
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" =============================================================================
" Section: vim-airline
" =============================================================================

let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

