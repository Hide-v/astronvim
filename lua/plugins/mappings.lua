return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        i = {
          ["<C-S-v>"] = { "<C-r>+", desc = "Paste from system clipboard" },
          ["<M-Up>"] = { "<Esc>:m -2<CR>gi", desc = "Move line up" },
          ["<M-Down>"] = { "<Esc>:m +2<CR>gi", desc = "Move line down" },
        },
        n = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
          ["<C-d>"] = { "10jzz" },
          ["<C-u>"] = { "10kzz" },
          ["<M-Up>"] = { ":m -2<CR>", desc = "Move line up" },
          ["<M-Down>"] = { ":m +2<CR>", desc = "Move line down" },

          -- Overseer
          ["<Leader>o"] = { "<cmd>WhichKey <Leader>o<cr>", desc = "󱗆 Overseer" },
          ["<Leader>ot"] = { "<cmd>OverseerToggle<cr>", desc = "Toggle overseer task list" },
          ["<Leader>or"] = { "<cmd>OverseerRun<cr>", desc = "Run overseer task" },
          ["<Leader>os"] = { "<cmd>OverseerShell<cr>", desc = "Run a shell command" },
          ["<Leader>oc"] = { "<cmd>OverseerClearCache<cr>", desc = "Clear overseer cache" },
        },
        v = {
          ["<M-Up>"] = { ":m '<-2<CR>gv", desc = "Move selected lines up" },
          ["<M-Down>"] = { ":m '>+1<CR>gv", desc = "Move selected lines down" },
        },
        t = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
        },
      },
    },
  },
}
