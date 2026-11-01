if not vim.g.neovide then return {} end

return {
  {
    "tenxsoydev/size-matters.nvim",
    config = function()
      require("size-matters").setup {
        reset_font = vim.o.guifont,
        notifications = { enable = false },
      }
    end,
  },
}
