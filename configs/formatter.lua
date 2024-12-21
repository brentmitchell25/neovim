local M = {}

M.setup = function()
  require("formatter").setup {
    filetype = {
      -- Formatter configurations for filetype "lua" go here
      -- and will be executed in order
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      toml = {
        require("formatter.filetypes.toml").taplo,
      },
      markdown = {
        require("formatter.filetypes.typescript").prettierd,
      },
      html = {
        require("formatter.filetypes.typescript").prettierd,
      },
      css = {
        require("formatter.filetypes.typescript").prettierd,
      },
      terraform = {
        require("formatter.filetypes.terraform").tofufmt,
      },
      json = {
        require("formatter.filetypes.typescript").prettierd,
      },
      javascript = {
        require("formatter.filetypes.typescript").prettierd,
        require("formatter.filetypes.typescript").eslint_d,
      },
      typescript = {
        require("formatter.filetypes.typescript").prettierd,
        require("formatter.filetypes.typescript").eslint_d,
      },
      typescriptreact = {
        require("formatter.filetypes.typescript").prettierd,
        require("formatter.filetypes.typescript").eslint_d,
      },
      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace,
      },
    },
  }
end

return M
