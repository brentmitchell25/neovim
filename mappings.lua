local M = {}

M.markdown = {
  n = {
    ["<leader>m"] = { ":MarkdownPreview<CR>", "toggle markdown preview" },
  },
}

M.general = {
  i = {
    ["jk"] = { "<Esc>", "escape to normal mode" },
  },
  n = {
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", "  move left" },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", " move right" },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", "move down" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", " move up" },
  },
}

M.dial = {
  n = {
    ["<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
    },
    ["<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
    },
    ["g<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "gnormal")
      end,
    },
    ["g<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "gnormal")
      end,
    },
  },
  v = {
    ["<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "visual")
      end,
    },
    ["<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "visual")
      end,
    },
    ["g<C-a>"] = {
      function()
        require("dial.map").manipulate("increment", "gvisual")
      end,
    },
    ["g<C-x>"] = {
      function()
        require("dial.map").manipulate("decrement", "gvisual")
      end,
    },
  },
}

M.neotest = {
  i = {},
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "ts capture under cursor" },
    ["<leader>cp"] = { "<cmd> TSPlaygroundToggle <CR>", "ts playground toggle" },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },
}

M.git = {
  n = {
    ["<leader>gn"] = { ":Neogit<cr>", "Neogit" },
  },
}

M.luasnip = {
  n = {
    -- source luasnip
    ["<leader>S"] = { ":source ~/.config/nvim/lua/custom/configs/luasnip.lua<CR>", "source lua snippets" },
  },
  i = {
    ["<C-k>"] = {
      function()
        local ls = require "luasnip"
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      "expand snippet or jump to next snippet",
      opts = { silent = true },
    },
    ["<C-j>"] = {
      function()
        local ls = require "luasnip"
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      "jump to previous snippet",
      opts = { silent = true },
    },
    ["<C-n>"] = {
      function()
        local ls = require "luasnip"
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      " change choice",
    },
    ["<C-u>"] = {
      function()
        require "luasnip.extras.select_choice"()
      end,
      " select choice",
    },
  },
  v = {
    ["<C-k>"] = {
      function()
        local ls = require "luasnip"
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      " expand snippet or jump to next snippet",
      opts = { silent = true },
    },
    ["<C-j>"] = {
      function()
        local ls = require "luasnip"
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      "jump to previous snippet",
      opts = { silent = true },
    },
  },
}

M.disabled = {
  n = {
    ["<S-b>"] = "",
    ["<C-l>"] = "",
  },
}

M.buffers = {
  n = {
    ["<leader>."] = { "<cmd> enew <CR>", "烙 new buffer" },
  },
}

M.clipboard = {
  n = {
    ["<leader>Y"] = { '"+yg', "yank to clipboard from cursor to end of line" },
    ["<leader>y"] = { '"+y', "yank to clipboard" },
    ["<leader>yy"] = { '"+yy', "yank line to clipboard" },
    ["<leader>p"] = { '"+p', "paste from clipboard before cursor" },
    ["<leader>P"] = { '"+P', "paste from clipboard after cursor" },
  },
  v = {
    ["<leader>y"] = { '"+y', "clipboard" },
    ["<leader>p"] = { '"+p', "paste from clipboard after cursor" },
    ["<leader>P"] = { '"+P', "paste from clipboard before cursor" },
  },
}

M.copilotchat = {
  n = {
    ["<leader>cct"] = {
      ":CopilotChatToggle<CR>",
      "CopilotChat - Toggle",
    },
    ["<leader>ccq"] = {
      function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      "CopilotChat - Quick chat",
    },
    ["<leader>cch"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    ["<leader>ccp"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      "CopilotChat - Prompt actions",
    },
  },
  v = {
    ["<leader>ccq"] = {
      function()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
        end
      end,
      "CopilotChat - Quick chat",
    },
    ["<leader>cch"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    ["<leader>ccp"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      "CopilotChat - Prompt actions",
    },
  },
}

M.telescope = {
  n = {
    ["<C-P>"] = {
      ":Telescope find_files<cr>",
      "find files in repository",
    },
    ["<leader>fts"] = {
      ":Telescope tmux sessions<cr>",
      "Find tmux sessions",
    },
    ["<leader>ftp"] = {
      ":Telescope tmux pane_contents<cr>",
      "Find tmux pane content",
    },
    ["<leader>ftw"] = {
      ":Telescope tmux windows<cr>",
      "Find tmux window",
    },
  },
}

M.undotree = {
  n = {
    ["<leader><F5>"] = {
      ":Telescope undo<cr>",
      "Undotree",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = {
      "<cmd>Trouble diagnostics toggle<cr>",
      "Diagnostics (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["<leader>xX"] = {
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      "Buffer Diagnostics (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["<leader>cs"] = {
      "<cmd>Trouble symbols toggle focus=false<cr>",
      "Symbols (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["<leader>cl"] = {
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      "LSP Definitions / references / ... (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["<leader>xL"] = {
      "<cmd>Trouble loclist toggle<cr>",
      "Location List (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["<leader>xQ"] = {
      "<cmd>Trouble qflist toggle<cr>",
      "Quickfix List (Trouble)",
      opts = { silent = true, noremap = true },
    },
    ["gR"] = {
      ":TroubleToggle lsp_references<cr>",
      "trouble lsp references",
      opts = { silent = true, noremap = true },
    },
  },
}

M.hop = {
  n = {
    ["<leader><leader>"] = { ":HopChar1<cr>", "hop to specific character in buffer" },
    ["<leader>smp"] = { "<cmd> HopPatternMW <CR>", "hop pattern any buffer" },
    ["<leader>sma"] = { "<cmd> HopAnywhereMW <CR>", "hop anywhere any buffer" },
    ["<leader>smc"] = { "<cmd> HopChar2MW <CR>", "hop character any buffer" },
    ["<leader>sml"] = { "<cmd> HopLineMW <CR>", "hop line any buffer" },
    ["<leader>sp"] = { "<cmd> HopPattern <CR>", "hop pattern in buffer" },
    ["<leader>sa"] = { "<cmd> HopAnywhere <CR>", "hop anywhere in buffer" },
    ["<leader>sc"] = { "<cmd> HopChar2 <CR>", "hop character in buffer" },
    ["<leader>sl"] = { "<cmd> HopLine <CR>", "hop line in buffer" },
  },
}

M.harpoon = {
  n = {
    ["<leader>o"] = {
      function()
        require("harpoon"):list():add()
      end,
      "harpoon append",
    },
    ["<M-a>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "harpoon 1",
    },
    ["<M-s>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "harpoon 2",
    },
    ["<M-d>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "harpoon 3",
    },
    ["<M-f>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "harpoon 4",
    },
    ["<leader>fm"] = {
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      "harpoon ui",
    },
  },
}

M.dadbod = {
  n = {
    ["<leader><leader>du"] = { ":DBUIToggle<CR>", "toggle dadbod sql editor" },
    ["<leader><leader>df"] = { ":DBUIFindBuffer<CR>", "dadbod find buffer" },
    ["<leader><leader>dr"] = { ":DBUIRenameBuffer<CR>", "dadbod rename buffer" },
    ["<leader><leader>dl"] = { ":DBUILastQueryInfo<CR>", "dadbod last query info" },
  },
}

M.lsp = {
  v = {
    ["<leader>ca"] = {
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      "choose code action for visual selection",
    },
  },
  n = {
    ["<leader>qf"] = {
      function()
        vim.lsp.buf.code_action {
          filter = function(a)
            return a.kind == "quickfix"
          end,
          apply = true,
        }
      end,
      "quick fix",
      opts = { noremap = true, silent = true },
    },
  },
}

M.tmux = {
  n = {
    ["<leader>tm"] = {
      function()
        local current_line = vim.api.nvim_get_current_line()

        -- This pattern captures the content inside the first pair of backticks.
        local code_inside_backticks = current_line:match "`(.+)`"
        if code_inside_backticks then
          local escaped_code = code_inside_backticks:gsub("'", "'\\''")
          escaped_code = escaped_code .. "\n" -- Add a newline to execute the command
          os.execute("tmux set-buffer '" .. escaped_code .. "'")
          os.execute "tmux paste-buffer -d -t right" -- Edit '-t right' as needed
        else
          print "No code found inside backticks on the current line."
        end
      end,
      "send code inside backticks to tmux",
      opts = { noremap = true, silent = true },
    },
    ["<leader>te"] = {
      function()
        local current_line = vim.api.nvim_get_current_line()
        local escaped_line = current_line:gsub("'", "'\\''")
        escaped_line = escaped_line .. "\n" -- Add a newline to execute the command
        os.execute("tmux set-buffer '" .. escaped_line .. "'")
        os.execute "tmux paste-buffer -d -t right"
      end,
      "send code on line to tmux",
      opts = { noremap = true, silent = true },
    },
  },
  v = {
    ["<leader>te"] = {
      function()
        local function get_whole_lines(from, to)
          local lines = {}
          if from == to then
            table.insert(lines, vim.api.nvim_buf_get_lines(0, from - 1, from, false)[1])
          else
            for i = from, to do
              table.insert(lines, vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1])
            end
          end
          return table.concat(lines, "\n")
        end

        local function get_selected_text_realtime()
          local start_pos = vim.fn.getpos "v"
          local end_pos = vim.fn.getpos "."

          -- We switch the start and end positions if the start is after the end line or character
          -- This way we can always select from the top down and from left to right
          if start_pos[2] > end_pos[2] or start_pos[3] > end_pos[3] then
            start_pos, end_pos = end_pos, start_pos
          end

          if vim.api.nvim_get_mode().mode == "V" then
            return get_whole_lines(start_pos[2], end_pos[2])
          end

          if start_pos[2] == end_pos[2] then
            return vim
              .api
              -- .nvim_buf_get_lines(0, start_pos[2] - 1, start_pos[2], false)[1]
              :sub(
                start_pos[3],
                end_pos[3] - 1
              )
          end

          local selected_text = {}
          for i = start_pos[2], end_pos[2] do
            local line_text = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
            if i == start_pos[2] then
              line_text = line_text:sub(start_pos[3])
            end
            -- If select last line, there need to get column of current cursor
            if i == end_pos[2] then
              line_text = line_text:sub(1, end_pos[3] - 1)
            end
            table.insert(selected_text, line_text)
          end

          return table.concat(selected_text, "\n")
        end

        local escaped_selection = get_selected_text_realtime():gsub("'", "'\\''")
        escaped_selection = escaped_selection .. "\n" -- Add a newline to execute the command
        os.execute("tmux set-buffer '" .. escaped_selection .. "'")
        os.execute "tmux paste-buffer -d -t right"
      end,
      "send selection to tmux until end of cursor",
      opts = { noremap = true, silent = true },
    },
  },
}

return M
