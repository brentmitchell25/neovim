local overrides = require "custom.configs.overrides"
local snippets = require "custom.configs.luasnip"

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false, auto_trigger = true },
        panel = { enabled = false },
        filetypes = {
          yaml = true,
          markdown = true,
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "zbirenbaum/copilot.lua" },
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    -- event = "BufEnter",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  { "vim-scripts/marvim", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "michaeljsmith/vim-indent-object", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-abolish", lazy = false },
  { "wellle/targets.vim", lazy = false },
  { "nvim-treesitter/playground", lazy = false },
  { "AndrewRadev/splitjoin.vim", lazy = false },
  { "vim-scripts/ReplaceWithRegister", lazy = false },
  { "MunifTanjim/nui.nvim", lazy = false },
  { "rcarriga/nvim-notify", lazy = false },
  -- { "nvim-treesitter/nvim-treesitter-textobjects", lazy = false, commit = "19a91a38b02c1c28c14e0ba468d20ae1423c39b2" },
  { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufEnter" },
  { "ray-x/lsp_signature.nvim", event = "BufEnter" },
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "hrsh7th/nvim-cmp", opts = overrides.cmp },
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "mbbill/undotree", event = "BufEnter" },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    event = "BufEnter",
    opts = {
      mac_window_bar = true,
      title = "",
      code_font_family = "CaskaydiaCove Nerd Font",
      watermark_font_family = "Pacifico",
      watermark = "",
      bg_theme = "default",
      breadcrumbs_separator = "/",
      has_breadcrumbs = false,
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim", -- optional
    },
    config = function()
      require("harpoon"):setup()
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    opts = {
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension "undo"
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  {
    "camgraff/telescope-tmux.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "tmux"
    end,
  },
  {
    "olacin/telescope-cc.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "conventional_commits"
    end,
  },
  {
    "tsakirist/telescope-lazy.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "lazy"
    end,
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "BufEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },
  { "L3MON4D3/LuaSnip", opts = snippets.override },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    config = function()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    event = "BufEnter",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "monaqa/dial.nvim",
    event = "BufEnter",
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
    event = "BufEnter",
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
      }
      require("lsp_lines").setup()
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
    event = "BufEnter",
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
    event = "BufEnter",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    event = "BufEnter",
    config = function()
      require("trouble").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "TimUntersberger/neogit",
    event = "BufEnter",
    config = function()
      require("custom.configs.neogit").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "phaazon/hop.nvim",
    event = "BufEnter",
    config = function()
      require("hop").setup {}
    end,
  },
  {
    "mvllow/modes.nvim",
    event = "BufEnter",
    config = function()
      vim.opt.cursorline = true
      require("modes").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufEnter",
    config = function()
      require("custom.configs.dap").setup()
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "BufEnter",
    config = function()
      require("custom.configs.formatter").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    event = "BufEnter",
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
