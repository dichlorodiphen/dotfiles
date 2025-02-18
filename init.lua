vim.cmd [[
  " Install vim-plug if not installed
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin()
  Plug 'github/copilot.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'folke/tokyonight.nvim'
  Plug 'cocopon/iceberg.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'vimwiki/vimwiki'
  Plug 'cespare/vim-toml', { 'branch': 'main' }
  Plug 'sevko/vim-nand2tetris-syntax'
  Plug 'sbdchd/neoformat'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-autoformat/vim-autoformat'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  call plug#end()
]]

vim.cmd('source /Users/dhyoung/.vimrc')

vim.opt.shortmess = {
  o = true
}

-- Copilot
require("CopilotChat").setup {
  -- See Configuration section for options
}
vim.g.copilot_enabled = false

-- Lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true })

