return {
  {
    "Shatur/neovim-ayu",
    main = "ayu",
    lazy = false,
    priority = 1000,
    opts = {
      mirage = false, -- true = ayu-mirage; light: ayu-light
      -- keep the old transparent background
      overrides = {
        Normal = { bg = "None" },
        NormalNC = { bg = "None" },
        SignColumn = { bg = "None" },
        EndOfBuffer = { bg = "None" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "ayu-dark" },
  },
}
