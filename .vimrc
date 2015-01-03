set t_Co=256
colo wombat256
set number
set shortmess=atI
set ts=2
set shiftwidth=2
set softtabstop=2

" vimbit 10 easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"

" vimbit 92 kep search pattern at center of screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
"

" part of vimbit 30 better command-line editing
imap <C-a> <Home>
imap <C-e> <End>
nmap <C-a> <Home>
nmap <C-e> <End>
"

" vimbit 13 80 character line coloring
if exists('+colorcolumn')
set colorcolumn=80
else
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
"

" vimbit 45 sudo save file
cmap w!! %!sudo tee > /dev/null %
"

set expandtab
:syn on
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


set showcmd      " Show (partial) command in status line.
set showmatch    " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase    " Do smart case matching
set incsearch    " Incremental search
set autowrite    " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set wildmenu      " bette rmenu or something
set backspace=2   " indent over EOLs
set autoindent    " keep indentation level
set confirm       " dialog asking to confirm things isntead of error

" statusline color
hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" statusline change on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" buffer prev and next
noremap  :bp<CR>
noremap  :bn<CR>

map J }
map K {

" line highlighting
hi CursorLine   cterm=NONE ctermbg=darkred
hi CursorColumn cterm=NONE ctermbg=darkred
set cursorline!
" set cursorcolumn!

" use pathogen

filetype off

" This stuff doesn't work on the old vim setups in solaris and centos
if version >= 702
   call pathogen#infect()
   call pathogen#helptags()
endif

filetype plugin on
syntax on

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

hi IndentGuidesOdd  guibg=red   ctermbg=235
hi IndentGuidesEven guibg=green ctermbg=236

" throw all temp files in ~/.vim-tmp/
set backupdir=~/.vim-tmp//,/tmp//
set directory=~/.vim-tmp//,/tmp//

"set title

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" tips
" { } pg skip
" zz to scroll current line to mid of scr
" % jumps to matching {[}}() etc
" H M L - high middle low of current screen
" ^ first non blank character
" n% - go to n percent of file
" nG  - go to nth line of file
" E and B - more strict e and b
" same with W
" ctrl n word completion
" >i{ indent block in
" <i{ decrease indent
" ctrl e and ctrl y scroll the text without changing line sel




" From http://vimcasts.org/episodes/tidying-whitespace/
" Preserves/Saves the state, executes a command, and returns to the saved state
" Modified from http://vimbits.com/bits/231
" Remove trailing whitespace on save
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" Execute clear whitespace on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")



"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Create a mapping (e.g. in your .vimrc) like this:
nmap <C-c> <Plug>Kwbd
