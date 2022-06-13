local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  --all
  b.code_actions.refactoring,

  -- typescript
  b.formatting.prettierd.with {
    command = "prettierd",
    prefer_local = "node_modules/.bin",
  },
  b.code_actions.eslint_d,
  b.diagnostics.eslint.with {
    command = "eslint_d",
    prefer_local = "node_modules/.bin",
  },

  -- python
  b.formatting.black,

  -- golang
  b.formatting.goimports,
  b.formatting.gofmt,
  b.diagnostics.golangci_lint,

  -- protobuf
  b.diagnostics.protolint,

  -- Lua
  b.formatting.stylua.with {
    extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
  },
  b.diagnostics.luacheck.with { extra_args = { "--global vim s c t f d i r sn isn" } },

  -- Rust
  b.formatting.rustfmt.with {
    extra_args = { "--edition=2021" },
  },

  -- Elixir
  b.formatting.mix,
  b.diagnostics.credo,
}

local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.setup = function()
  null_ls.setup {
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            vim.lsp.buf.formatting_sync()
          end,
        })
      end
    end,
  }
end

return M
