return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    local function get_os_icon()
      local os = jit.os:lower()
      if os == "linux" then
        local f = io.open("/etc/os-release", "r")
        if f then
          local content = f:read "*all"
          f:close()
          if content:find "arch" then return " 󰣇 " end
        end
        return "  "
      elseif os == "osx" or os == "macos" then
        return "  "
      elseif os == "windows" then
        return "  "
      else
        return "  "
      end
    end

    local mode = status.component.builder {
      {
        provider = function()
          local icon = get_os_icon()
          local m = vim.fn.mode(1):sub(1, 1):upper()
          return icon .. " " .. m .. "  "
        end,
        padding = { left = 1, right = 2 },
      },
      surround = false,
      hl = function()
        return {
          fg = status.hl.mode_bg(),
          bg = "bg",
          bold = true,
        }
      end,
    }

    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      mode,
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter(),
      status.component.nav(),
    }

    return opts
  end,
}
