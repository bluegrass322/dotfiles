-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
--vim.api.nvim_create_augroup('lua', {})
autocmd('TermOpen', {
  --group = 'lua',
  callback = function()
    vim.cmd "startinsert"
  end
})

local cmd = vim.api.nvim_create_user_command
cmd("W", "w", {})
cmd("Q", "q", {})
cmd("WQ", "wq", {})
