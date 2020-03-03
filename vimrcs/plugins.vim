" =============================================================================
" File: plugins.vim
" Description: Plugin Configuration
" =============================================================================

" =============================================================================
" Section: Minimal package manager
" =============================================================================

" Load minpac
packadd minpac

" Initialize minpac and load all "start" plugins automatically
call minpac#init()

" Register plugins for install/update/clean
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/syntastic')
call minpac#add('junegunn/fzf')
"call minpac#add('Lokaltog/vim-powerline') deprecated use lightline instead
call minpac#add('itchyny/lightline.vim')
call minpac#add('vim-scripts/Wombat')
call minpac#add('vim-scripts/wombat256.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-commentary')
call minpac#add('majutsushi/tagbar')

" Define minpac user commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>

