return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets", "nvim-mini/mini.icons" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "super-tab",
      },
      cmdline = {
        enabled = true,
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then return { "buffer" } end
          if type == ":" or type == "@" then return { "cmdline" } end
          return {}
        end,
        completion = {
          menu = { auto_show = true },
          ghost_text = { enabled = false },
          list = {
            selection = {
              preselect = false,
            },
          },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        keyword = {
          range = "full",
        },
        list = {
          selection = {
            preselect = function(ctx) return not require("blink.cmp").snippet_active { direction = 1 } end,
            auto_insert = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              kind = {
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          cmdline = {
            name = "cmdline",
            module = "blink.cmp.sources.cmdline",
            min_keyword_length = function(ctx)
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then return 2 end
              return 0
            end,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "nvim-mini/mini.icons",
    lazy = true,
    optional = true,
    opts = {
      lsp = {
        array = { glyph = "" },
        boolean = { glyph = "󰨙" },
        class = { glyph = "" },
        color = { glyph = "" },
        constant = { glyph = "" },
        constructor = { glyph = "" },
        enum = { glyph = "" },
        enummember = { glyph = "" },
        event = { glyph = "" },
        field = { glyph = "" },
        file = { glyph = "" },
        folder = { glyph = "" },
        ["function"] = { glyph = "" },
        interface = { glyph = "" },
        key = { glyph = "" },
        keyword = { glyph = "" },
        method = { glyph = "" },
        module = { glyph = "" },
        namespace = { glyph = "" },
        null = { glyph = "" },
        number = { glyph = "" },
        object = { glyph = "" },
        operator = { glyph = "" },
        package = { glyph = "" },
        property = { glyph = "" },
        reference = { glyph = "" },
        snippet = { glyph = "" },
        string = { glyph = "" },
        struct = { glyph = "" },
        text = { glyph = "" },
        typeparameter = { glyph = "" },
        unit = { glyph = "" },
        value = { glyph = "" },
        variable = { glyph = "" },
        NewCond = { glyph = "" },
        OnceFunc = { glyph = "" },
        OnceValue = { glyph = "" },
      },
    },
  },
}
