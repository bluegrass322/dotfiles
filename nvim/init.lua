----------------------------------------------
-- Basic Options
----------------------------------------------
local options = {
    autoread = true,
    expandtab = true,
    hlsearch = true,

    ignorecase = true,
    incsearch = true,

    number = true,
    relativenumber = true,

    shiftwidth = 4,
    smartindent = true,

    tabstop = 4,
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


----------------------------------------------
-- Commands
----------------------------------------------
local command = vim.api.nvim_create_user_command

command("W", "w", {})
command("Q", "q", {})
command("WQ", "wq", {})


----------------------------------------------
-- Keymaps
----------------------------------------------
local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "ge", "G", opts)
keymap("n", "gh", "0", opts)
keymap("n", "gs", "^", opts)
keymap("n", "gl", "$", opts)

--nnoremap <silent> gp :bprev<CR>
--nnoremap <silent> gn :bnext<CR>

keymap("n", "<ESC><ESC>", ":nohlsearch<CR>", opts)

keymap("i", "jk", "<ESC>", opts)


----------------------------------------------
-- Plugins
----------------------------------------------
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
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
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
        'hrsh7th/nvim-cmp',
        dependencies = {
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'L3MON4D3/LuaSnip' },
          { 'saadparwaiz1/cmp_luasnip' },
        },
    },
})

require("local")

vim.cmd[[colorscheme iceberg]]

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Cmp
local cmp = require "cmp"

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

require("rust_analyzer")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
