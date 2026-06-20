return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function(_, opts)
    require("nvim-surround").setup(opts, {
      keymaps = {
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual_line = "gS",
        visual = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    })
  end,
}

