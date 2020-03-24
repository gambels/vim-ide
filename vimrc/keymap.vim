
" File: keymap.vim
" Descritpion: Keymap configuration
" =============================================================================

" Set mapleader and maplocalleader
let mapleader=","
let maplocalleader=","

" Edit and source keymap file
noremap <Leader>ek :split $MYVIMRCPATH/keymap.vim<CR>
noremap <Leader>sk :source $MYVIMRCPATH/keymap.vim<CR>

" =============================================================================
" Section: Toggle views
" =============================================================================

" Help toggle
nnoremap <F1> :HelpToggle<CR>

" NERDTree toggle
nnoremap <F7> :NERDTreeToggle<CR>

" Tagbar toogle
nnoremap <F8> :TagbarToggle<CR>

" QuickFix toggle
nnoremap <F9> :QuickFixToggle<CR>

" Show tab list
"noremap <F2> <ESC>tl<CR>

" Show pending tasks list
"noremap <F2> <ESC>:TaskList<CR>

" =============================================================================
" Section: Editor quikies
" =============================================================================

" Quick save
noremap <C-s> <ESC>:w<CR>
noremap <Leader>w :w!<CR>
inoremap <C-s> <ESC>:w<CR>i

" Quick exit
noremap <C-q> <ESC>:confirm qa<CR>
noremap <Leader>q :confirm qa<CR>
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

" =============================================================================
" Section: Tab navigation
" =============================================================================

nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tm :tabm<CR>
nnoremap tt :tabnew<CR>
nnoremap to :tabonly!<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :confirm bdelete<CR>:tabclose<CR>gT

" Open tag under cursor in new tab
"noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" =============================================================================
" Section: Buffer navigation
" =============================================================================
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>c :confirm bdelete<CR>:tabclose<CR>gT

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

" =============================================================================
" Section: Window navigation
" =============================================================================

" Select window with Alt- Up/Down/Let/Right
nnoremap <silent> <A-Up> :wincmd k<CR>
nnoremap <silent> <A-Down> :wincmd j<CR>
nnoremap <silent> <A-Left> :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

" Split window with Leader - and |
noremap <silent> <Leader>- :split<CR>
noremap <silent> <Leader>\| :vsplit<CR>

" Zoom window with Alt-F11
nnoremap <silent> <A-F11> :call WindowZoomToggle()<CR>
inoremap <silent> <A-F11> <C-O><A-F11>

" =============================================================================
" Section: Source navigation
" =============================================================================

nnoremap <F3> :YcmCompleter GoTo<CR>
nnoremap <F4> :YcmCompleter GoToReferences<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Look for files under current directory
nnoremap <C-p> :<C-u>FZF<CR>
" prevent opening FZF search result in NERD Tree
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : "").":FZF\<CR>"

" =============================================================================
" Section: Formatting
" =============================================================================

" To UTF8/Unix
nnoremap <Leader>su :setlocal ff=unix<CR>:set fileencoding=utf8<CR>:w<CR>

" ReFormat the Document
vnoremap <Tab> >
vnoremap <S-Tab> <

" Indent Out
"noremap <F6> >i}<CR>
"inoremap <F6> <ESC>>i}<CR>i

" Indent In
"noremap <F5> <i}<CR>
"inoremap <F5> <ESC><i}<CR>i

" Strip trailing white spaces
nnoremap <silent> <Leader>tws :call TrimWhiteSpace()<CR>

" Search and replace selection on Ctrl+r
vnoremap <C-r> "hy:%s/<C-r>h//gc<Left><Left><Left>

" Move Lines / Selections
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <ESC>:m .+1<CR>==gi
inoremap <C-Up> <ESC>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" =============================================================================
" Section: Spell checking
" =============================================================================

" Enable/Disable spell checking
noremap <Leader>ee :setlocal spell spelllang=en<CR>
noremap <Leader>ed :setlocal spell spelllang=de<CR>
noremap <Leader>ds :setlocal spell spelllang=<CR>

" =============================================================================
" Section: Debugging
" =============================================================================

" Syntastic Check the syntax of the buffer
noremap <Leader>sc <ESC>:SyntasticCheck<CR>:Errors<CR>
inoremap <Leader>sc <ESC>:SyntasticCheck<CR>:Errors<CR>i
noremap <Leader>sr <ESC>:SyntasticReset<CR>

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

