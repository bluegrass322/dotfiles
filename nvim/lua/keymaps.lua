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

-- if not vim.g.vscode then
--   -- map('n', '<leader>bn', '<cmd>enew<cr>', { desc = 'New buffer' })

--   -- Resize window
--   map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
--   map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
--   map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
--   map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })

-- else
--   local vs = require('vscode-neovim')

--   -- Resize view size
--   map('n', '<C-Up>', function() vs.call('workbench.action.increaseViewSize') end, { desc = 'Increase window height' })
--   map('n', '<C-Down>', function() vs.call('workbench.action.decreaseViewSize') end, { desc = 'Decrease window height' })
--   map('n', '<C-Right>', function() vs.call('workbench.action.increaseViewSize') end, { desc = 'Increase window width' })
--   map('n', '<C-Left>', function() vs.call('workbench.action.decreaseViewSize') end, { desc = 'Decrease window width' })
-- end

-- VScode の場合とで実行コマンドを分けたい場合
local vs = vim.g.vscode and require('vscode-neovim') or ''
local keymaps = {
  n = {
    {
      key = '<leader>e',
      cmd = {
        '<cmd>Lexplore<cr>',
        function() vs.call('workbench.action.toggleSidebarVisibility') end,
      },
      opts = {
        desc = 'File Explore',
        silent = true,
      },
    },

    -- Buffer
    {
      key = '<leader>bd',
      cmd = {
        '<cmd>bdelete<cr>',
        function() vs.call('workbench.action.closeActiveEditor') end,
      },
      opts = {
        desc = 'Close buffer',
        silent = true,
      },
    },
    {
      key = '<leader>gp',
      cmd = {
        '<cmd>bprevious<cr>',
        function() vs.call('workbench.action.previousEditor') end,
      },
      opts = {
        desc = 'Prev buffer',
        silent = true,
      },
    },
    {
      key = '<leader>gn',
      cmd = {
        '<cmd>bnext<cr>',
        function() vs.call('workbench.action.nextEditor') end,
      },
      opts = {
        desc = 'Next buffer',
        silent = true,
      },
    },

    -- Split window
    {
      key = '<leader>sph',
      cmd = {
        '<cmd>split<cr>',
        function() vs.call('workbench.action.splitEditorDown') end,
      },
      opts = { desc = 'Split horizontal' },
    },
    {
      key = '<leader>spv',
      cmd = {
        '<cmd>vsplit<cr>',
        function() vs.call('workbench.action.splitEditorRight') end,
      },
      opts = { desc = 'Split vertical' },
    },
    {
      key = '<leader>cl',
      cmd = {
        '<cmd>close<cr>',
        function() vs.call('workbench.action.closeActiveEditor') end,
      },
      opts = { desc = 'Close current window' },
    },
  },

  v = {
  },
}

for mode, maps in pairs(keymaps) do
  for i, set in ipairs(maps) do
    local cmd = vim.g.vscode and set['cmd'][2] or set['cmd'][1]
    map(mode, set['key'], cmd, set['opts'])
  end
end
