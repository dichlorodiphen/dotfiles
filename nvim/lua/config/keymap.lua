-- Opts
-- TODO: Move to another file if this gets unmanageable
vim.opt.compatible = false
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess:append("ltToOCF")

---

local function nset (...)
  return vim.keymap.set("n", ...)
end

-- Tab shortcuts
nset("<leader>1", "1gt")
nset("<leader>1", "1gt")
nset("<leader>2", "2gt")
nset("<leader>3", "3gt")
nset("<leader>4", "4gt")
nset("<leader>5", "5gt")
nset("<leader>6", "6gt")
nset("<leader>7", "7gt")
nset("<leader>8", "8gt")
nset("<leader>9", "9gt")
nset("<leader>t", ":tabnew<CR>")

-- Split navigation
nset("<c-k>", ":wincmd k<CR>", {silent = true})
nset("<c-j>", ":wincmd j<CR>", {silent = true})
nset("<c-h>", ":wincmd h<CR>", {silent = true})
nset("<c-l>", ":wincmd l<CR>", {silent = true})

