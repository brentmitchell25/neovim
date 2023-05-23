local overrides = require "custom.configs.overrides"
local snippets = require "custom.configs.luasnip"

return {
  -- ["github/copilot.vim"] = {},
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  { "vim-scripts/marvim", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "michaeljsmith/vim-indent-object", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "simnalamburt/vim-mundo", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-abolish", lazy = false },
  { "wellle/targets.vim", lazy = false },
  { "nvim-treesitter/playground", lazy = false },
  { "AndrewRadev/splitjoin.vim", lazy = false },
  { "vim-scripts/ReplaceWithRegister", lazy = false },
  { "MunifTanjim/nui.nvim", lazy = false },
  { "rcarriga/nvim-notify", lazy = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
  { "ray-x/lsp_signature.nvim", lazy = false },
  { "benfowler/telescope-luasnip.nvim" },
  { "LinArcX/telescope-env.nvim" },
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "hrsh7th/nvim-cmp", opts = overrides.cmp },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "L3MON4D3/LuaSnip", opts = snippets.override },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "nvim-telescope/telescope.nvim", opts = overrides.telescope },
  {
    "monaqa/dial.nvim",
    config = function()
      require("custom.configs.dial").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("lsp_lines").register_lsp_virtual_lines()
    end,
  },
  -- {
  --   "nvim-treesitter/playground",
  --   cmd = "TSCaptureUnderCursor",
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("custom.configs.ufo").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.configs.autotag").setup()
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "TimUntersberger/neogit",
    config = function()
      require("custom.configs.neogit").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require("hop").setup {}
    end,
  },
  {
    "mvllow/modes.nvim",
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.configs.dap").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("custom.configs.null-ls").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    lazy = false,
    build = "./install.sh",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
    },
    config = function()
      require("custom.configs.cmp-tabnine").setup()
    end,
  },
  -- ["nvim-neotest/neotest"] = {
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "haydenmeade/neotest-jest",
  --     "nvim-neotest/neotest-go",
  --   },
  --   config = function()
  --     require("custom.configs.neotest").setup()
  --   end,
  -- },
  -- ["bennypowers/nvim-regexplainer"] = {
  --   config = function()
  --     require("custom.configs.regexplainer").setup()
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  -- },
  --["rust-lang/rust.vim"] = {
  --opt = true,
  --},
  --["simrat39/rust-tools.nvim"] = {
  --opt = true,
  --setup = function()
  --nvchad.packer_lazy_load "rust-tools.nvim"
  --end,
  --},
}
