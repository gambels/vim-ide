" =============================================================================
" File: filetypes.vim
" Description: Filetype configuration
" =============================================================================

augroup filetype_generic
  autocmd!

  " Automatically remove all trailing spaces for all file types
  " autocmd BufWritePre     * :call TrimWhiteSpace()
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.md,*.cpp,*.h,*.hpp,*.c,*.mk,*.vim :call TrimWhiteSpace()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Re-source .vimrc on saving
  autocmd! BufWritePost $MYVIMRCPATH/*.vim source ~/.vimrc
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_text
  autocmd!
  autocmd FileType text setlocal spelllang=en,de
augroup END

augroup filetype_cpp
  autocmd!
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType cpp setlocal filetype=cpp
  autocmd FileType cpp setlocal spelllang=en
augroup END

" Enable omni completion
"autocmd FileType xhtml,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript          setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType javascript          setlocal omnifunc=jscomplete#CompleteJS
"autocmd FileType python              setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml                 setlocal omnifunc=xmlcomplete#CompleteTags

