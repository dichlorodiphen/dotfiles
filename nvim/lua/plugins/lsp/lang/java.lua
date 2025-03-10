local function bemol()
  local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
  local ws_folders_lsp = {}
  if bemol_dir then
    local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
    if file then
      for line in file:lines() do
        table.insert(ws_folders_lsp, line)
      end
      file:close()
    end
  end

  for _, line in ipairs(ws_folders_lsp) do
    vim.lsp.buf.add_workspace_folder(line)
  end
end

-- Scan bemol directory on attach if client is jdtls.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local client = vim.lsp.get_client_by_id(e.data.client_id)
    if client and client.name == "jdtls" then
      bemol()
    end
  end
})

return {
  java = {
    inlayHints = {
      parameterNames = {
        enabled = "all",
      },
    },
  },
}
