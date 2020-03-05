" =============================================================================
" File: plugins.vim
" Description: Plugin Configuration
" =============================================================================

" =============================================================================
" Section: Minimal package manager
" =============================================================================
function! PackInit() abort
  packadd minpac

  " Initialize minpac and load all "start" plugins automatically
  call minpac#init()

  " Register plugins for install/update/clean
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('scrooloose/syntastic')
  call minpac#add('junegunn/fzf')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('vim-scripts/Wombat')
  call minpac#add('vim-scripts/wombat256.vim')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('majutsushi/tagbar')
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
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" =============================================================================
" Section: junegunn/fzf
" =============================================================================

nnoremap <C-p> :<C-u>FZF<CR>

" =============================================================================
" Section: ligthline
" =============================================================================

let g:lightline = { 
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"[ro]":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

