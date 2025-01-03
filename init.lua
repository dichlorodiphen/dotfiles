vim.cmd('source /Users/dichlorodiphen/.vimrc')

vim.opt.shortmess = {
  o = true
}

-- Lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
