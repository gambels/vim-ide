
" File: keymap.vim
" Descritpion: Keymap configuration
" =============================================================================

" Set mapleader and maplocalleader
let mapleader=","
let maplocalleader=","

" Edit and source keymap file
noremap <leader>ek :split $MYVIMRCPATH/keymap.vim<CR>
noremap <leader>sk :source $MYVIMRCPATH/keymap.vim<CR>

" =============================================================================
" Section: Toggle views
" =============================================================================

" Help toggle
nnoremap <F1> :call HelpToggle()<CR>

" NERDTree toggle
nnoremap <F7> :NERDTreeToggle<CR>

" Tagbar toogle
nnoremap <F8> :TagbarToggle<CR>

" QuickFix toggle
nnoremap <F9> :call QuickFixToggle()<CR>

" Show tab list
"noremap <F2> <ESC>tl<CR>

" Show pending tasks list
"map <F2> <ESC>:TaskList<CR>

" =============================================================================
" Section: Editor quikies
" =============================================================================

" Quick save
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>i

" Quick exit
noremap <C-q> <ESC>:confirm qa<CR>
inoremap <C-q> <ESC>:confirm qa<CR>i

" Quick copy to [register +]
"noremap <C-c> "+y<CR>
"inoremap <C-c> <ESC>"+yi

" Quick paste from [register +]
"noremap <C-v> "+P<CR>
"inoremap <C-v> <ESC>"+pa

" Quick cut
"noremap <C-x> "+x<CR>
"inoremap <C-x> <ESC>"+xi

" Paste toggle
"nnoremap <S-F2> :set invpaste paste?<CR>
"set pastetoggle=<S-F2>

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
command W w !sudo tee "%" > /dev/null


" =============================================================================
" Section: Tab navigation
" =============================================================================

nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tm :tabm<CR>
nnoremap tt :tabnew<CR>
nnoremap to :tabonly!<CR>

nnoremap <C-T> :tabnew<CR>
nnoremap <C-W> :confirm bdelete<CR>:tabclose<CR>gT

" Open tag under cursor in new tab
"noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" =============================================================================
" Section: Buffer navigation
" =============================================================================
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>c :confirm bdelete<CR>:tabclose<CR>gT

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" =============================================================================
" Section: Window navigation
" =============================================================================

" Select window with Alt- Up/Down/Let/Right
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

" Split window with Leader - and |
noremap <silent> <leader>- :split<CR>
noremap <silent> <leader>\| :vsplit<CR>

" Zoom window with Alt-F11
nnoremap <silent> <A-F11> :call WindowZoomToggle()<CR>
inoremap <silent> <A-F11> <C-O><A-F11>

" =============================================================================
" Section: Source navigation
" =============================================================================

nnoremap <F3> :YcmCompleter GoTo<CR>
nnoremap <F4> :YcmCompleter GoToReferences<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" look for files under current directory
nnoremap <C-p> :<C-u>FZF<CR>
" prevent opening FZF search result in NERD Tree
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : "").":FZF\<CR>"

" =============================================================================
" Section: Formatting
" =============================================================================

" To UTF8/Unix
nmap <leader>su :setlocal ff=unix<CR>:set fileencoding=utf8<CR>:w<CR>

" ReFormat the Document
vmap <Tab> >
vmap <S-Tab> <

" Indent Out
" map <F6> >i}<CR>
" imap <F6> <ESC>>i}<CR>i

" Indent In
" map <F5> <i}<CR>
" imap <F5> <ESC><i}<CR>i

" Strip trailing white spaces
nnoremap <silent> <leader>tws :call TrimWhiteSpace()<CR>

" Search and replace selection on Ctrl+r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Move Lines / Selections
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" =============================================================================
" Section: Spell checking
" =============================================================================

" Enable/Disable spellchecking
map <leader>ee :setlocal spell spelllang=en<CR>
map <leader>ed :setlocal spell spelllang=de<CR>
map <leader>ds :setlocal spell spelllang=<CR>

" =============================================================================
" Section: Debugging
" =============================================================================

" Syntastic Check the syntax of the buffer
map <leader>sc <ESC>:SyntasticCheck<CR>:Errors<CR>
imap <leader>sc <ESC>:SyntasticCheck<CR>:Errors<CR>i
map <leader>sr <ESC>:SyntasticReset<CR>

" Keymap for vdebug
let g:vdebug_keymap = {
      \ "run" : "<A-F5>",
      \ "run_to_cursor" : "<A-F1>",
      \ "step_over" : "<A-F2>",
      \ "step_into" : "<A-F3>",
      \ "step_out" : "<A-F4>",
      \ "close" : "<A-F6>",
      \ "detach" : "<A-F7>",
      \ "set_breakpoint" : "<A-F10>",
      \ "get_context" : "<A-F11>",
      \ "eval_under_cursor" : "<A-F12>",
      \}

