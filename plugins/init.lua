return {
  ["github/copilot.vim"] = {},
  ["tpope/vim-dadbod"] = {},
  ["dstein64/vim-startuptime"] = {},
  ["kristijanhusak/vim-dadbod-ui"] = {},
  ["janko/vim-test"] = {},
  ["scrooloose/nerdcommenter"] = {},
  ["vim-scripts/marvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["michaeljsmith/vim-indent-object"] = {},
  ["terryma/vim-multiple-cursors"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["simnalamburt/vim-mundo"] = {},
  ["christoomey/vim-tmux-navigator"] = {},
  ["tpope/vim-abolish"] = {},
  ["jose-elias-alvarez/nvim-lsp-ts-utils"] = {},
  ["wellle/targets.vim"] = {},
  ["AndrewRadev/splitjoin.vim"] = {},
  ["MunifTanjim/nui.nvim"] = {},
  ["williamboman/nvim-lsp-installer"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["folke/trouble.nvim"] = {
    config = function()
      require("trouble").setup()
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  --["luukvbaal/stabilize.nvim"] = {
  --config = function()
  --require("stabilize").setup()
  --end,
  --},
  ["iamcco/markdown-preview.nvim"] = {
    ft = "markdown",
    run = "cd app && yarn install",
  },
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },
  ["bennypowers/nvim-regexplainer"] = {
    config = function()
      require("custom.plugins.regexplainer").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  ["monaqa/dial.nvim"] = {
    config = function()
      require("custom.plugins.dial").setup()
    end,
  },
  ["phaazon/hop.nvim"] = {
    config = function()
      require("hop").setup {}
    end,
  },
  ["folke/which-key.nvim"] = {
    config = function()
      require("which-key").setup {
        plugins = {
          presets = {
            operators = false,
          },
        },
      }
    end,
  },
  ["mvllow/modes.nvim"] = {
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end,
  },
  ["rust-lang/rust.vim"] = {
    opt = true,
  },
  ["simrat39/rust-tools.nvim"] = {
    opt = true,
    setup = function()
      require("core.utils").packer_lazy_load "rust-tools.nvim"
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    opt = true,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["tzachar/cmp-tabnine"] = {
    run = "./install.sh",
    after = "nvim-cmp", -- Here
    requires = "hrsh7th/nvim-cmp",
    config = function()
      require("custom.plugins.cmp-tabnine").setup()
    end,
  },
}
