call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
"Plug 'dense-analysis/ale'
Plug 'knsh14/vim-github-link'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'godoctor/godoctor.vim'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'pangloss/vim-javascript'
"Plug 'Quramy/tsuquyomi'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mlaursen/vim-react-snippets'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/vimproc.vim'
Plug 'jparise/vim-graphql'

Plug 'tpope/vim-dadbod'

Plug 'petobens/poet-v'

Plug 'github/copilot.vim'

call plug#end()


set t_Co=256
colo wombat256
set number
set shortmess=atI
set ts=4
set shiftwidth=4
set softtabstop=4

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

" 100 character line coloring
if exists('+colorcolumn')
set colorcolumn=100
else
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
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

"map J }
"map K {

" line highlighting
hi CursorLine   cterm=NONE ctermbg=darkred
hi CursorColumn cterm=NONE ctermbg=darkred
set cursorline!
set cursorcolumn!

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
" ctrl L redraws

" remove spaces on end of lines
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" call deoplete#custom#option('omni_patterns', {
" \ 'go': '[^. *\t]\.\w*',
" \})

" let g:fzf_layout = { 'down': '50%' }
nnoremap <C-j> :Files<CR>


" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.config/nvim/extra_snippets'


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"au Filetype go nmap gi <Plug>(go-info)
"au Filetype go nmap gm <Plug>(go-imports)
"au Filetype go nmap gt <Plug>(go-def-vertical)

"\    'go': ['bingo', 'gobuild', 'gofmt', 'golangci-lint', 'golint', 'gometalinter', 'gopls', 'gosimple', 'govet', 'staticcheck'],

"let g:ale_linters = {'go': ['bingo', 'gobuild', 'gofmt', 'golangci-lint', 'golint', 'gometalinter', 'gopls', 'gosimple', 'gotype', 'govet', 'staticcheck']}
let g:ale_linters = {
\    'go': ['golangci-lint', 'govet', 'gofmt', 'golint', 'gosimple'],
\    'proto': ['prototool-lint'],
\}
let g:ale_go_golangci_lint_options = '--enable-all --disable wsl'
"let g:ale_linter_aliases = {'proto': ['prototool-lint']}

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

source ~/.config/nvim/init.vim.coc

autocmd InsertLeave * call coc#float#close_all()

set title

set bg=dark

" Configure petobens/poet-v
let g:poetv_executables = ['poetry']


" Configure github copilot
let g:copilot_no_maps = v:true

imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-J> copilot#Next()
imap <silent><script><expr> <C-K> copilot#Previous()
imap <silent><script><expr> <C-H> copilot#Dismiss()

" leader + s for 'replace thing under cursor'
nnoremap <leader>s "zye:%s/<C-R>z/
