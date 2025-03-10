return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "jdtls",
        "ts_ls",
      }
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "BufWinEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    opts = function()
      -- Related configuration (TODO: refactor this file)
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
      vim.lsp.inlay_hint.enable(true)

      -- Set up nvim-cmp.
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
          },
          {
            { name = 'buffer' },
          },
          {
            { name = "nvim_lsp_signature_help" },
          })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      -- Setting up lspconfig
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.jdtls.setup {
        capabilities = capabilities,
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        settings = require("plugins.lsp.lang.go"),
      }

      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        settings = require("plugins.lsp.lang.ts"),
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = require("plugins.lsp.lang.lua")
      }

      -- Retrigger FileType autocmds to start language servers. Necessary because we load nvim-cmp after FileType.
      vim.api.nvim_exec_autocmds("FileType", {})
    end
  }
}
