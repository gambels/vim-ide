" =============================================================================
" File: plugins.vim
" Description: Plugin Configuration
" =============================================================================

" =============================================================================
" Section: Minimal package manager
" =============================================================================
function! PackInit() abort
  packadd minpac

  if exists('*minpac#init')
    " Initialize minpac and load all "start" plugins automatically
    call minpac#init({'verbose': '3'})

    " Minimal package manager
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " A tree explorer plugin for vim.
    call minpac#add('scrooloose/nerdtree')
    " Syntax checking hacks for vim.
    call minpac#add('scrooloose/syntastic')
    " A command-line fuzzy finder
    call minpac#add('junegunn/fzf',{'do': 'call fzf#install()'})
    " lean & mean status/tabline for vim that's light as air
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    " Pairs of handy bracket mappings
    call minpac#add('tpope/vim-unimpaired')
    " Asynchronous build and test dispatcher
    call minpac#add('tpope/vim-dispatch')
    " Comment stuff out
    call minpac#add('tpope/vim-commentary')
    " A Git wrapper so awesome, it should be illegal
    call minpac#add('tpope/vim-fugitive')
    " A class outline viewer for Vim
    call minpac#add('majutsushi/tagbar')
    " A code-completion engine for Vim
    " call minpac#add('ycm-core/YouCompleteMe',{'do': {-> system('./install.py --clangd-completer')}})
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
let NERDTreeShowHidden = 1

" =============================================================================
" Section: scrooloose/syntastic
" =============================================================================

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open =0
let g:syntastic_check_on_wq = 0

" =============================================================================
" Section: junegunn/fzf
" =============================================================================

nnoremap <C-p> :<C-u>FZF<CR>

" =============================================================================
" Section: vim-airline
" =============================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#formatter = 'unique_tail'

