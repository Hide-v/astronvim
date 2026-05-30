if not vim.g.neovide then return {} end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          guifont = "Maple_Mono_NF_CN:h14",
          linespace = 0,
        },
        g = {
          -- 透明度与间距
          neovide_opacity = 0.85,
          neovide_scale_factor = 1.0,
          neovide_padding_left = 5,

          -- 动画与渲染
          neovide_cursor_animation_length = 0.1,
          neovide_cursor_trail_size = 0.8,
          neovide_cursor_antialiasing = true,
          neovide_refresh_rate = 165,
          neovide_scroll_animation_length = 0.3,

          -- 特效
          neovide_cursor_vfx_mode = "pixiedust",
          neovide_cursor_vfx_particle_lifetime = 1.2,
          neovide_cursor_vfx_particle_density = 20.0,
          neovide_cursor_vfx_particle_speed = 15.0,
        },
      },
    },
  },
}
