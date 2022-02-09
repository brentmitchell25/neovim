return {
  {
    "github/copilot.vim",
  },
  {
    "janko/vim-test",
  },
  {
    "scrooloose/nerdcommenter",
  },
  {
    "vim-scripts/marvim",
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({})
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "michaeljsmith/vim-indent-object",
  },
  {
    "terryma/vim-multiple-cursors",
  },
  {
    "tpope/vim-repeat",
  },
  {
    "tpope/vim-surround",
  },
  {
    "simnalamburt/vim-mundo",
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "tpope/vim-abolish",
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
  },
  {
    "wellle/targets.vim",
  },
  {
    "AndrewRadev/splitjoin.vim",
  },
  {
    "williamboman/nvim-lsp-installer",
  },
  {
    "simrat39/rust-tools.nvim",
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load("rust-tools.nvim")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    opt = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    after = "nvim-cmp", -- Here
    requires = "hrsh7th/nvim-cmp",
    config = function()
      print("loading")
      require("custom.plugins.cmp-tabnine").setup()
    end,
  },
}
