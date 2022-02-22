local lsp_ts_utils_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not lsp_ts_utils_ok then
  print("nvim-lsp-ts-utils not found")
  return
end
if not lsp_installer_ok then
  print("nvim-lsp-ts-utils not found")
  return
end
if not lspconfig_ok then
  print("lspconfig not found")
  return
end

local M = {}

local function set_key_mappings(bufnr)
  -- Mappings.
  local opts = { noremap = true, silent = true }
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<D-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>i", "<cmd>TSLspImportAll<CR>", opts)
  buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
end

local function quick_fix()
  local params = {
    command = "_typescript.applyCodeAction",
    arguments = { data = vim.api.nvim_buf_get_name(0), kind = "quickfix", title = "QuickFix" },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

M.setup_lsp = function(attach, capabilities)
  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {},
      commands = {},
    }
    opts.on_attach = function(client, bufnr)
      set_key_mappings(bufnr)
      client.resolved_capabilities.document_formatting = false
      attach(client, bufnr)
    end

    if server.name == "tsserver" then
    elseif server.name == "eslint" then
      opts.settings = {}
      server:setup(opts)
    elseif server.name == "gopls" then
      opts.settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      }
      server:setup(opts)
    elseif server.name == "pyright" then
      server:setup(opts)
    elseif server.name == "rust_analyzer" then
      opts.settings = {
        ["rust-analyzer"] = {
          experimental = {
            procAttrMacros = true,
          },
        },
      }

      server:setup(opts)
    elseif server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      }
      server:setup(opts)
    end

    vim.cmd([[ do User LspAttachBuffers ]])
  end)

  lspconfig.tsserver.setup({
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    --init_options = ts_utils.init_options,
    init_options = ts_utils.init_options,
    commands = {
      QuickFix = {
        quick_fix,
        description = "Quick Fix",
      },
    },
    --
    on_attach = function(client, bufnr)
      set_key_mappings(bufnr)
      client.resolved_capabilities.document_formatting = false
      vim.cmd("autocmd BufWritePre *.ts EslintFixAll")
      vim.cmd("autocmd BufWritePre *.ts TSLspOrganizeSync")
      -- defaults
      ts_utils.setup({
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
      })

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      print("TSLSP attached")

      -- no default maps, so you may want to define some here
      local opts = { silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end,
  })

  lspconfig.sumneko_lua.setup({
    on_attach = function(client, bufnr)
      set_key_mappings(bufnr)
      client.resolved_capabilities.document_formatting = false
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  })

  -- the above tsserver config will remvoe the tsserver's inbuilt formatting
  -- since I use null-ls with denofmt for formatting ts/js stuff.
end

return M
