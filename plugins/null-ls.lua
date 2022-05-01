local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  -- typescript
  b.formatting.prettierd.with({
    command = "prettierd",
    prefer_local = "node_modules/.bin",
  }),
  b.code_actions.eslint_d,
  b.diagnostics.eslint.with({
    command = "eslint_d",
    prefer_local = "node_modules/.bin",
  }),

  -- python
  b.formatting.black,

  -- golang
  b.formatting.gofmt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,

  -- protobuf
  b.diagnostics.protolint,

  -- Lua
  b.formatting.stylua.with({
    extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
  }),
  b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

  -- Rust
  b.formatting.rustfmt.with({
    extra_args = { "--edition=2021" },
  }),
}

local M = {}

M.setup = function(on_attach)
  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
