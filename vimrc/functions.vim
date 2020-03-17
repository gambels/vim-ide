" =============================================================================
" File:  functions.vim
" Description: Function definition
" =============================================================================

" Delete trailing white spaces
function! TrimWhiteSpace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" Strip trailing whitespaces
nnoremap <silent> <leader>tws :call TrimWhiteSpace()<CR>

" =============================================================================
" Section: Configure auto commands
" =============================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd BufWritePre     * :call TrimWhiteSpace()
  "autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.md,*.cpp,*.h,*.hpp,*.c,*.mk,*.vim :call TrimWhiteSpace()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

