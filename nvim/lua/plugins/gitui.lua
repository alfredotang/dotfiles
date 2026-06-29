-- 用 gitui 取代 LazyVim 預設的 lazygit
return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>gg",
      function()
        Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.git() })
      end,
      desc = "GitUI (Root Dir)",
    },
    {
      "<leader>gG",
      function()
        Snacks.terminal({ "gitui" })
      end,
      desc = "GitUI (cwd)",
    },
  },
}
