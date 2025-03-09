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
vim.opt.cursorline = true

---

local function nset (from, to, opts)
  local defaultOpts = { silent = true }
  opts = vim.tbl_extend("force", defaultOpts, opts or {})
  return vim.keymap.set("n", from, to, opts)
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
nset("<leader>t", ":tabnew<cr>")

-- Split navigation
nset("<c-k>", ":wincmd k<cr>")
nset("<c-j>", ":wincmd j<cr>")
nset("<c-h>", ":wincmd h<cr>")
nset("<c-l>", ":wincmd l<cr>")

-- qfl
nset("<leader>qn", ":cnext<cr>")
nset("<leader>qp", ":cprev<cr>")
nset("<leader>qc", ":cexpr []<cr>")
nset("<leader>qf", function ()
  local id = vim.fn.win_getid()
  if id == 0 then
    vim.notify("Could not get ID for current window and tab.", vim.log.levels.WARN)
    return
  end

  local win = vim.fn.getwininfo(id)[1]
  if win.quickfix == 1 then
    vim.cmd("cclose")
    return
  end

  vim.cmd("copen")
end)

