local ts_utils = require "nvim-lsp-ts-utils"
local lspconfig = require "lspconfig"
local quickfix = require "custom.plugins.lsp-fix-current"
local nvchad_lsp = require "plugins.configs.lspconfig"

local capabilities = nvchad_lsp.capabilities

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  nvchad_lsp.on_attach(client, bufnr)
  -- Add multiple signatures for method signature help dialogues
  require("lsp_signature").on_attach({
    bind = true,
  }, bufnr)
end

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
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    local augroup = vim.api.nvim_create_augroup("TSFormatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      command = [[ silent! :EslintFixAll ]],
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      command = [[ silent! :TSLspOrganizeSync ]],
    })
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
