return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- <leader>ff / <leader><space>
        files = {
          hidden = true, -- show dotfiles
          ignored = true, -- include .gitignore'd files
        },
        -- <leader>/ live grep
        grep = {
          hidden = true,
          ignored = true,
        },
        -- <leader>e file explorer
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
      -- 避免被這些目錄洗版
      exclude = { ".git", "node_modules", ".DS_Store" },
    },
  },
}
