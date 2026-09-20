-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.markdown" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.color.transparent-nvim" },

  { import = "astrocommunity.recipes.vscode" },

  { import = "astrocommunity.editing-support.auto-save-nvim" },

  { import = "astrocommunity.code-runner.overseer-nvim" },

  { import = "astrocommunity.motion.tabout-nvim" },
  -- import/override with your plugins folder
}
