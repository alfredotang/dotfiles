return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      -- keep the old transparent background
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight-night" },
  },
}
