-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>to", ":tabnew<CR>") -- close current split window
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current split window

-- buffer manager
local bufferOpts = { noremap = true, silent = true }
keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", bufferOpts) --  go to next tab
keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", bufferOpts) --  go to previous tab
keymap.set("n", "<C-w>", "<Cmd>BufferClose<CR>", bufferOpts)

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<C-e>", ":NvimTreeFindFile<CR>") -- toggle file explorer

-- telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<C-f>", builtin.find_files, {}) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>f", builtin.grep_string, {}) -- find string in current working directory as you type
keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- find string in current working directory as you type
keymap.set("n", "<leader>fb", builtin.buffers, {}) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gcm", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gbr", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gst", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
