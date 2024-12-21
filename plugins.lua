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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    event = "BufEnter",
    opts = {},
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leetcode" ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      lang = "typescript",
      arg = "leetcode",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
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
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- keys = {
    --   { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    --   { "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    --   { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    --   { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    --   { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
    -- },
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian Vault",
        },
        {
          name = "work",
          path = "~/OneDrive - kochind.com/Obsidian",
        },
      },

      -- see below for full list of options 👇
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
      -- bg_theme = "default",
      bg_color = "#535c68",
      breadcrumbs_separator = "/",
      has_breadcrumbs = true,
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
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install && git clean -df",
    init = function()
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
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.setupopts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    event = "BufEnter",
    config = function()
      require("oil").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --   event = "BufEnter",
  --   config = function()
  --     vim.diagnostic.config {
  --       virtual_text = false,
  --     }
  --     require("lsp_lines").setup()
  --   end,
  -- },
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
