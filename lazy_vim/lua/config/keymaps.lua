-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set
vim.g.mapleader = " "

map("i", "jk", "<esc>", { desc = "Escape from insert mode" })

-- Move cursor
map("n", "gt", "gg", { silent = true, desc = "Go to the top of the screen" })
map("n", "ge", "G", { silent = true, desc = "Go to the end of the file" })
map("n", "gh", "0", { silent = true, desc = "Go to the start of the line" })
map("n", "gs", "^", { silent = true, desc = "Go to first non-whitespace character of the line" })
map("n", "gl", "$", { silent = true, desc = "Go to the end of the line" })

-- Terminal
map("n", "<leader>t", "<cmd>term<cr>", { silent = true, desc = "Open Terminal" })
map("t", "<esc>", "<C-\\><C-n>", { silent = true, desc = "Escape insert mode" })

if not vim.g.vscode then
  map("n", "bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
  map("n", "gp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "gn", "<cmd>bnext<cr>", { desc = "Next buffer" })
else
  local vs = require("vscode-neovim")
  map("n", "bd", function() vs.call("workbench.action.closeActiveEditor") end)
  map("n", "gp", function() vs.call("workbench.action.previousEditor") end)
  map("n", "gn", function() vs.call("workbench.action.nextEditor") end)
end
