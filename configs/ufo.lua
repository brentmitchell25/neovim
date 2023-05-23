local ok, ufo = pcall(require, "ufo")

if not ok then
  print "Could not load nvim-ufo"
  return
end

local M = {}
vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true

M.setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ufo.setup()
end

return M
