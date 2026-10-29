-- 類 GitLens：行內 blame + 檔案歷史 / diff
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview (working tree)" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
    },
  },
}
