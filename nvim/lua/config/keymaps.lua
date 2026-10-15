-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function copy_path(mods, label)
  return function()
    local path = vim.fn.expand("%:" .. mods)
    vim.fn.setreg("+", path)
    vim.notify("Copied " .. label .. ": " .. path)
  end
end

vim.keymap.set("n", "<leader>2", copy_path(".", "relative path"), { desc = "Copy Relative Path" })
vim.keymap.set("n", "<leader>@", copy_path("p", "absolute path"), { desc = "Copy Absolute Path" })
