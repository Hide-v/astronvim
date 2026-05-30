return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
          ["<C-d>"] = { "10j" },
          ["<C-u>"] = { "10k" },
        },
        t = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
        },
      },
    },
  },
}
