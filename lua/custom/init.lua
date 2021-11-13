local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({
    "nathom/filetype.nvim",
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  })
  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    after = "nvim-cmp", -- Here
    requires = "hrsh7th/nvim-cmp",
    config = function()
      require("custom.plugins.cmp-tabnine").setup()
    end,
  })
end)

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.did_load_filetypes = 1
