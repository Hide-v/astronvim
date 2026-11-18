-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

-- selene: allow(undefined_variable)
-- @diagnostic disable: undefined-global
-- @module 'snacks'
---@type LazySpec
return {
  -- 格式化插件配置
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
      },
    },
  },

  -- Insert To Normal清除Snippet占位符
  {
    "L3MON4D3/LuaSnip",
    init = function()
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = { "i:n", "s:n" },
        callback = function()
          -- 加上 pcall 防止极端情况下 luasnip 未完全初始化时报错
          local ok, luasnip = pcall(require, "luasnip")
          if ok and luasnip.session and luasnip.session.current_nodes then
            local buf = vim.api.nvim_get_current_buf()
            if luasnip.session.current_nodes[buf] and not luasnip.session.jump_active then luasnip.unlink_current() end
          end
        end,
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function(_, opts)
      opts.size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end

      opts.persist_size = false

      require("toggleterm").setup(opts)
    end,
  },
  {
    "okuuva/auto-save.nvim",
    opts = {
      trigger_events = {
        immediate_save = { "BufLeave", "QuitPre", "VimSuspend" },
        defer_save = { "TextChanged" },
        cancel_deferred_save = { "InsertEnter" },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            follow_file = true,
          },
        },
      },
      explorer = {
        enabled = true,
        tree = true,
        watch = true,
        replace_netrw = true,
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          local root = require("astrocore.rooter").detect(0, false)[1]
          Snacks.explorer { cwd = root and root.paths[1] or vim.fn.getcwd() }
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fE",
        function() Snacks.explorer { cwd = vim.fn.getcwd() } end,
        desc = "Explorer Snacks (cwd)",
      },
      {
        "<leader>e",
        "<leader>fe",
        desc = "Explorer Snacks (root dir)",
        remap = true,
      },
      {
        "<leader>E",
        "<leader>fE",
        desc = "Explorer Snacks (cwd)",
        remap = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
