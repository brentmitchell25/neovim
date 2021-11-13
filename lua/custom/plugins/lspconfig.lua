local M = {}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  local lsp_installer = require("nvim-lsp-installer")

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
      client.resolved_capabilities.document_formatting = false
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
      attach(client, bufnr)
    end

    if server.name == "tsserver" then
      opts.commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      }
    elseif server.name == "rust_analyzer" then
      opts.settings = {
        ["rust-analyzer"] = {
          experimental = {
            procAttrMacros = true,
          },
        },
      }

      opts.on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- Run nvchad's attach
        attach(client, bufnr)

        -- Use nvim-code-action-menu for code actions for rust
        buf_set_keymap(
          bufnr,
          "n",
          "<leader>ca",
          "lua vim.lsp.buf.range_code_action()<CR>",
          { noremap = true, silent = true }
        )
        buf_set_keymap(
          bufnr,
          "v",
          "<leader>ca",
          "lua vim.lsp.buf.range_code_action()<CR>",
          { noremap = true, silent = true }
        )
      end
    elseif server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      }
    end

    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
  end)

  --typescript

  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.commands.OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  })

  lspconfig.sumneko_lua.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.commands.OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  })

  -- the above tsserver config will remvoe the tsserver's inbuilt formatting
  -- since I use null-ls with denofmt for formatting ts/js stuff.
end

return M
