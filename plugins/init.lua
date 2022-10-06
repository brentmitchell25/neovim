return {
  -- ["github/copilot.vim"] = {},
  ["jose-elias-alvarez/nvim-lsp-ts-utils"] = {},
  ["tpope/vim-dadbod"] = {},
  ["kristijanhusak/vim-dadbod-ui"] = {},
  ["janko/vim-test"] = {},
  ["scrooloose/nerdcommenter"] = {},
  ["vim-scripts/marvim"] = {},
  ["tpope/vim-fugitive"] = {},
  ["michaeljsmith/vim-indent-object"] = {},
  -- ["mg979/vim-visual-multi"] = {
  --   branch = "master",
  -- },
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["simnalamburt/vim-mundo"] = {},
  ["christoomey/vim-tmux-navigator"] = {},
  ["tpope/vim-abolish"] = {},
  ["wellle/targets.vim"] = {},
  ["AndrewRadev/splitjoin.vim"] = {},
  ["vim-scripts/ReplaceWithRegister"] = {},
  ["MunifTanjim/nui.nvim"] = {},
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
  ["ray-x/lsp_signature.nvim"] = {},
  ["folke/which-key.nvim"] = {
    disable = true,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("lsp_lines").register_lsp_virtual_lines()
    end,
  },
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },
  -- ["kevinhwang91/nvim-ufo"] = {
  --   requires = "kevinhwang91/promise-async",
  --   config = function()
  --     require("custom.plugins.ufo").setup()
  --   end,
  -- },
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.autotag").setup()
    end,
  },
  -- ["nvim-neotest/neotest"] = {
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "haydenmeade/neotest-jest",
  --     "nvim-neotest/neotest-go",
  --   },
  --   config = function()
  --     require("custom.plugins.neotest").setup()
  --   end,
  -- },
  ["ThePrimeagen/refactoring.nvim"] = {
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  ["benfowler/telescope-luasnip.nvim"] = {},
  ["LinArcX/telescope-env.nvim"] = {},
  -- ["goolord/alpha-nvim"] = {
  --   disable = false,
  -- },
  ["folke/trouble.nvim"] = {
    config = function()
      require("trouble").setup()
    end,
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  ["TimUntersberger/neogit"] = {
    config = function()
      require("custom.plugins.neogit").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
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
  ["mvllow/modes.nvim"] = {
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end,
  },
  --["rust-lang/rust.vim"] = {
  --opt = true,
  --},
  --["simrat39/rust-tools.nvim"] = {
  --opt = true,
  --setup = function()
  --nvchad.packer_lazy_load "rust-tools.nvim"
  --end,
  --},
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("custom.plugins.dap").setup()
    end,
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
