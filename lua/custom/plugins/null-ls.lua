local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettierd.with({
    command = "prettierd",
    prefer_local = "node_modules/.bin",
  }),
  null_ls.builtins.code_actions.eslint_d,
  b.diagnostics.eslint.with({
    command = "eslint_d",
    prefer_local = "node_modules/.bin",
  }),

  -- golang
  null_ls.builtins.formatting.gofmt,
  null_ls.builtins.formatting.goimports,
  null_ls.builtins.diagnostics.golangci_lint,
  --- end golang

  -- Lua
  b.formatting.stylua.with({
    extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
  }),
  b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

  b.formatting.rustfmt,
}

local M = {}

M.setup = function(on_attach)
  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
