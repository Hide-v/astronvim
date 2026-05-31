if not vim.g.neovide then return {} end

local local_settings = {
  font_size = 14,
  scale_factor = 1.0,
}

local local_config_path = vim.fn.stdpath "config" .. "/lua/local/neovide_local.lua"
if vim.fn.filereadable(local_config_path) == 1 then
  local ok, local_cfg = pcall(dofile, local_config_path)
  if ok and type(local_cfg) == "table" then
    if local_cfg.font_size then local_settings.font_size = local_cfg.font_size end
    if local_cfg.scale_factor then local_settings.scale_factor = local_cfg.scale_factor end
  end
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          guifont = "Maple_Mono_NF_CN:h" .. local_settings.font_size,
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
