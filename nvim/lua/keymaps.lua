local map = vim.keymap.set
vim.g.mapleader = " "

map("i", "jk", "<esc>", { desc = "Escape from insert mode" })
map("n", "<esc><esc>", "<cmd>noh<cr>", { desc = "Escape and clear hlsearch" })

-- Move cursor
map("n", "gt", "gg", { silent = true, desc = "Go to the top of the screen" })
map("n", "ge", "G", { silent = true, desc = "Go to the end of the file" })
map("n", "gh", "0", { silent = true, desc = "Go to the start of the line" })
map("n", "gs", "^", { silent = true, desc = "Go to first non-whitespace character of the line" })
map("n", "gl", "$", { silent = true, desc = "Go to the end of the line" })

-- Terminal
map("t", "<esc>", "<C-\\><C-n>", { silent = true, desc = "Escape insert mode" })

-- Resize window using <ctrl> arrow keys
--[[
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
]]

-- Move Lines
--[[
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
]]

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
--[[
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
]]

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- New file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

if not vim.g.vscode then
  map("n", "<leader>e", "<cmd>Lexplore<cr>", { desc = "File Explore" })

  map("n", "bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
  map("n", "gp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "gn", "<cmd>bnext<cr>", { desc = "Next buffer" })

  -- Move to window using the <ctrl> hjkl keys
  map("n", "<C-h>", "<C-w>h", { remap = true, desc = "Go to left window" })
  map("n", "<C-j>", "<C-w>j", { remap = true, desc = "Go to lower window" })
  map("n", "<C-k>", "<C-w>k", { remap = true, desc = "Go to upper window" })
  map("n", "<C-l>", "<C-w>l", { remap = true, desc = "Go to right window" })
else
  local vs = require('vscode-neovim')

  map("n", "bd", function() vs.call('workbench.action.closeActiveEditor') end)
  map("n", "gp", function() vs.call('workbench.action.previousEditor') end)
  map("n", "gn", function() vs.call('workbench.action.nextEditor') end)
end
