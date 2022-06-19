local lsp_ts_utils_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local quickfix = require "custom.plugins.lsp-fix-current"

if not lsp_ts_utils_ok then
  print "nvim-lsp-ts-utils not found"
  return
end
if not lsp_installer_ok then
  print "nvim-lsp-ts-utils not found"
  return
end
if not lspconfig_ok then
  print "lspconfig not found"
  return
end

local M = {}

M.setup_lsp = function(attach, capabilities)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    attach(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  end
  lsp_installer.setup {}

  --lspconfig.tailwindcss.setup {
  --on_attach = on_attach,
  --capabilities = capabilities,
  --filetypes = { "heex", "html" },
  --}
  lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "heex", "html" },
  }
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        experimental = {
          procAttrMacros = true,
        },
      },
    },
  }
  lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }

  lspconfig.tsserver.setup {
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    --init_options = ts_utils.init_options,
    init_options = ts_utils.init_options,
    commands = {
      QuickFix = {
        quickfix,
        description = "Quick Fix",
      },
    },
    --
    capabilities = capabilities,
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      vim.cmd "autocmd BufWritePre *.ts EslintFixAll"
      vim.cmd "autocmd BufWritePre *.ts TSLspOrganizeSync"
      -- defaults
      ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        -- lower numbers = higher priority
        import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},

        -- inlay hints
        auto_inlay_hints = true,
        inlay_hints_highlight = "Comment",

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = false,
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)
    end,
  }

  local default_servers = {
    "dockerls",
    "eslint",
    "elixirls",
    "pyright",
    "jsonls",
    "sqlls",
    "bashls",
    "yamlls",
  }
  for _, lsp in pairs(default_servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  -- the above tsserver config will remvoe the tsserver's inbuilt formatting
  -- since I use null-ls with denofmt for formatting ts/js stuff.
end

return M
