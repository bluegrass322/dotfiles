local map = vim.keymap.set
vim.g.mapleader = ' '

map('i', 'jk', '<esc>', { silent = true, desc = 'Escape from insert mode' })

-- Terminal
map('t', '<esc>', '<C-\\><C-n>', { silent = true, desc = 'Escape insert mode' })

map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<esc><esc>', '<cmd>noh<cr>', { silent = true, desc = 'Escape and clear hlsearch' })
map('n', 'gt', 'gg', { silent = true, desc = 'Go to the top of the screen' })
map('n', 'ge', 'G', { silent = true, desc = 'Go to the end of the file' })
map('n', 'gh', '0', { silent = true, desc = 'Go to the start of the line' })
map('n', 'gs', '^', { silent = true, desc = 'Go to first non-whitespace character of the line' })
map('n', 'gl', '$', { silent = true, desc = 'Go to the end of the line' })

-- Move to window
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
--[[
map('n', 'n', ''Nn'[v:searchforward].'zv'', { expr = true, desc = 'Next search result' })
map('x', 'n', ''Nn'[v:searchforward]', { expr = true, desc = 'Next search result' })
map('o', 'n', ''Nn'[v:searchforward]', { expr = true, desc = 'Next search result' })
map('n', 'N', ''nN'[v:searchforward].'zv'', { expr = true, desc = 'Prev search result' })
map('x', 'N', ''nN'[v:searchforward]', { expr = true, desc = 'Prev search result' })
map('o', 'N', ''nN'[v:searchforward]', { expr = true, desc = 'Prev search result' })
]]

map('n', 'b[', '<cmd>bprevious<cr>', { desc = 'Prev buffer', silent = true })
map('n', 'b]', '<cmd>bnext<cr>', { desc = 'Next buffer', silent = true })

map('n', '<leader>e', '<cmd>Lexplore<cr>', { desc = 'Open explore', silent = true })

--   -- Resize window
--   map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
--   map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
--   map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
--   map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })

if vim.g.vscode then
  local vs = require('vscode-neovim')


  map('n', 'b[', function() vs.call('workbench.action.previousEditor') end, { silent = true })
  map('n', 'b]', function() vs.call('workbench.action.nextEditor') end,  { silent = true })

  map('n', '<leader>e', function() vs.call('workbench.action.toggleSidebarVisibility') end, { silent = true })
  map('n', '<leader>f', function() vs.call('workbench.action.quickOpen') end, { silent = true })
  map('n', '<leader>/', function() vs.call('filesExplorer.findInFolder') end, { silent = true })

--   -- Resize view size
--   map('n', '<C-Up>', function() vs.call('workbench.action.increaseViewSize') end, { desc = 'Increase window height' })
--   map('n', '<C-Down>', function() vs.call('workbench.action.decreaseViewSize') end, { desc = 'Decrease window height' })
--   map('n', '<C-Right>', function() vs.call('workbench.action.increaseViewSize') end, { desc = 'Increase window width' })
--   map('n', '<C-Left>', function() vs.call('workbench.action.decreaseViewSize') end, { desc = 'Decrease window width' })
end
