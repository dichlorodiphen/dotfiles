" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" ------------------
" coc-nvim
" ------------------

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ------------------

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Create new tab
noremap <leader>t :tabnew<CR>

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Wrap after end of word
set linebreak

" Increase cmd history length
set history=200

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
" set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" filetype plugin indent on
" " On pressing tab, insert 2 spaces
" set expandtab
" " show existing tab with 2 spaces width
" set tabstop=2
" set softtabstop=2
" " when indenting with '>', use 2 spaces width
" set shiftwidth=2

filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab

if has("autocmd")
  " Makefile hard tabs
  autocmd FileType make set noexpandtab softtabstop=0

  " Assembly NASM syntax
  autocmd FileType asm set noexpandtab softtabstop=0 syntax=nasm

  " Comment continuation in Java
  autocmd FileType java,c,cpp setlocal comments-=:// comments+=f://

  " Git commit wrapping
  autocmd FileType gitcommit setlocal tw=72

  " Racket
  autocmd filetypedetect BufReadPost *.rkt,*.rktl,*.rktd set filetype=scheme

  autocmd BufWrite *.cpp,*.cc,*.h,*.hpp,*.c :Autoformat
endif

" Install vim-plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM-PLUG
call plug#begin()

" papercolor theme
Plug 'NLKNguyen/papercolor-theme'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" vimwiki
Plug 'vimwiki/vimwiki'

" TOML syntax highlighting
Plug 'cespare/vim-toml', { 'branch': 'main' }

" nand2tetris syntax
Plug 'sevko/vim-nand2tetris-syntax'

" neoformat (for ocamlformat)
Plug 'sbdchd/neoformat'

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" calendar-vim
Plug 'mattn/calendar-vim'

" goyo
Plug 'junegunn/goyo.vim'

" rust.vim
Plug 'rust-lang/rust.vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-autoformat
Plug 'vim-autoformat/vim-autoformat'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

" CONFIGURING COC
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-clangd']

" CONFIGURING RUST.VIM
let g:rustfmt_autosave = 1

" CONFIGURING FZF.VIM
" Use fd for fzf
" NOTE: I don't use fzf for anything other than vimwiki search right now. Must
" set up a better system for ignores if I do.
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow -E .git -E backups -E "*.swp" -E .gitignore'
" Search vimwiki
function! VimwikiFzfSearch()
  let l:wiki_path = expand('$HOME/vimwiki')
  call fzf#vim#files(l:wiki_path)
endfunction
command! VimwikiFzfSearch call VimwikiFzfSearch()
nnoremap <leader>ws :VimwikiFzfSearch<CR>
" Follow link in new tab
nmap <leader>wt <Plug>VimwikiTabnewLink
" disable <leader>ws in vimwiki
" nmap <F15> <Plug>VimwikiUISelect

" Shortcut for calendar
nnoremap <leader>cc :Calendar<CR>
" Shortcut for today in calendar
function! OpenCalendarForToday()
  let l:current_date = strftime('%Y-%m-%d')
  let l:path_to_today = expand('$HOME/vimwiki/diary/') . l:current_date . '.md'
  execute 'edit ' . l:path_to_today
endfunction
command! OpenCalendarForToday call OpenCalendarForToday()
nnoremap <leader>ct :OpenCalendarForToday<CR>

" Superfile shortcut
function! LaunchSuperfile()
  silent execute '!spf ' . expand('%:p:h')
  redraw!
endfunction
command! Spf call LaunchSuperfile()
noremap <leader>spf :Spf<CR>

noremap <C-j> :VimwikiToggleListItem<CR>
inoremap <C-j> <C-o>:VimwikiToggleListItem<CR>

" zz shortcut
inoremap <C-z> <C-o>zz
noremap <C-z> zz

" Multiple vimwikis
let g:vimwiki_list = [{'path': '~/vimwiki/personal/', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/vimwiki/work/', 'syntax': 'markdown', 'ext': '.md'}]

" set up theme
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set termguicolors
set background=dark
colorscheme PaperColor

" goyo shortcuts
noremap <leader>gg :Goyo<CR>

" use markdown with vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]

" OCaml
" :set rtp+=/Users/dichlorodiphen/.opam/4.14.0/share/merlin/vim

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_available_tools = []
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if isdirectory(s:opam_share_dir . "/" . tool)
    call add(s:opam_available_tools, tool)
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 479a17575ac219cabc549d0acb50c0e8 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/dichlorodiphen/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
