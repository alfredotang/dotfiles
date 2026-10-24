return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- files / grep 用 snacks 預設：不含 hidden 和 .gitignore'd 檔案
        -- <leader>ff / <leader><space>
        -- files = {
        --   hidden = true, -- show dotfiles
        --   ignored = true, -- include .gitignore'd files
        -- },
        -- <leader>/ live grep
        -- grep = {
        --   hidden = true,
        --   ignored = true,
        -- },
        -- <leader>e file explorer
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
      exclude = { ".git", "node_modules", ".DS_Store", "**/packages/swagger/bruno/**/*.yml", "**/.next" },
    },
  },
}
