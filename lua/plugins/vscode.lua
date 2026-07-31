-- don't do anything in non-vscode instances
if not vim.g.vscode then return {} end

-- a list of known working plugins with vscode-neovim, update with your own plugins
local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "flash.nvim",
}

local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end

---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<CMD>Find<CR>",
          ["<Leader>fw"] = "<CMD>call VSCodeNotify('workbench.action.findInFiles')<CR>",
          ["<Leader>ls"] = "<CMD>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",

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
        i = {
          ["<C-S-v>"] = { "<C-r>+", desc = "Paste from system clipboard" },
          ["<M-Up>"] = { "<Esc>:m -2<CR>gi", desc = "Move line up" },
          ["<M-Down>"] = { "<Esc>:m +2<CR>gi", desc = "Move line down" },
        },
        v = {
          ["<M-Up>"] = { ":m '<-2<CR>gv", desc = "Move selected lines up" },
          ["<M-Down>"] = { ":m '>+1<CR>gv", desc = "Move selected lines down" },
        },
        t = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
        },
      },
      -- disable treesitter highlighting
      treesitter = {
        highlight = false,
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
}
