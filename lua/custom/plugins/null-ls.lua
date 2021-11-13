local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettierd,
  b.diagnostics.eslint.with({
    command = "eslint_d",
  }),

  -- Lua
  b.formatting.stylua.with({
    extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
  }),
  b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

  b.formatting.rustfmt,
}

local M = {}

M.setup = function(on_attach)
  null_ls.config({
    sources = sources,
  })
  require("lspconfig")["null-ls"].setup({ on_attach = on_attach })
end

return M
