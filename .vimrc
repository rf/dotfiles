set t_Co=256
colo wombat256
set number
set shortmess=atI
set ts=3
set shiftwidth=3
set softtabstop=3

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
hi CursorLine   cterm=NONE ctermbg=black
hi CursorColumn cterm=NONE ctermbg=black
set cursorline!
set cursorcolumn!

" use pathogen

filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin on
syntax on

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
" ctrl L redraws
