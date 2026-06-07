return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        i = {
          ["<C-S-v>"] = { "<C-r>+", desc = "Paste from system clipboard" },
        },
        n = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
          ["<C-d>"] = { "10jzz" },
          ["<C-u>"] = { "10kzz" },
        },
        t = {
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
        },
      },
    },
  },
}
