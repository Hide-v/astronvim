-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

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
}
