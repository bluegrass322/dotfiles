vim.cmd('source ~/dotfiles/.vimrc')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " " 

require("lazy").setup({
  { "cocopon/iceberg.vim" },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
})

vim.cmd[[colorscheme iceberg]]

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f<CR>', builtin.find_files, {})
vim.keymap.set('n', '<leader>/<CR>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- ============================
--   LSP
-- ============================
require("mason").setup()
require("mason-lspconfig").setup()
