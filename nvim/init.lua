----------------------------------------------
-- Basic Options
----------------------------------------------
local options = {
    autoread = true,
    clipboard = 'unnamedplus',
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
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "ge", "G", opts)
keymap("n", "gh", "0", opts)
keymap("n", "gs", "^", opts)
keymap("n", "gl", "$", opts)

keymap("n", "bc", ":bd<CR>", opts)
keymap("n", "gp", ":bprev<CR>", opts)
keymap("n", "gn", ":bnext<CR>", opts)

keymap("n", "<ESC><ESC>", ":nohlsearch<CR>", opts)

keymap("n", "s", '"_s', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)

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
require("lazy").setup({
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    };
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    { "github/copilot.vim", lazy=false, },
    { "lewis6991/gitsigns.nvim" },
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
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
})

-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Cmp
local cmp = require("cmp")

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

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Git signs
require('gitsigns').setup()


-- Indent blankline
require("ibl").setup({
    indent = {
        char = "▏",
    },
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>f/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

if vim.fn.filereadable("./lua/local") == 0 then
    require("local")
end


-- Colorscheme
local result = vim.api.nvim_exec(
[[
    hi clear
    syntax reset
    let g:colors_name = "warp_icy"
    set background=dark
    set t_Co=256
    hi Normal guifg=#00bcd4 ctermbg=NONE guibg=#021012 gui=NONE

    hi DiffText guifg=#00acc1 guibg=NONE
    hi ErrorMsg guifg=#00acc1 guibg=NONE
    hi WarningMsg guifg=#00acc1 guibg=NONE
    hi PreProc guifg=#00acc1 guibg=NONE
    hi Exception guifg=#00acc1 guibg=NONE
    hi Error guifg=#00acc1 guibg=NONE
    hi DiffDelete guifg=#00acc1 guibg=NONE
    hi GitGutterDelete guifg=#00acc1 guibg=NONE
    hi GitGutterChangeDelete guifg=#00acc1 guibg=NONE
    hi cssIdentifier guifg=#00acc1 guibg=NONE
    hi cssImportant guifg=#00acc1 guibg=NONE
    hi Type guifg=#00acc1 guibg=NONE
    hi Identifier guifg=#00acc1 guibg=NONE
    hi PMenuSel guifg=#4dd0e1 guibg=NONE
    hi Constant guifg=#4dd0e1 guibg=NONE
    hi Repeat guifg=#4dd0e1 guibg=NONE
    hi DiffAdd guifg=#4dd0e1 guibg=NONE
    hi GitGutterAdd guifg=#4dd0e1 guibg=NONE
    hi cssIncludeKeyword guifg=#4dd0e1 guibg=NONE
    hi Keyword guifg=#4dd0e1 guibg=NONE
    hi IncSearch guifg=#80deea guibg=NONE
    hi Title guifg=#80deea guibg=NONE
    hi PreCondit guifg=#80deea guibg=NONE
    hi Debug guifg=#80deea guibg=NONE
    hi SpecialChar guifg=#80deea guibg=NONE
    hi Conditional guifg=#80deea guibg=NONE
    hi Todo guifg=#80deea guibg=NONE
    hi Special guifg=#80deea guibg=NONE
    hi Label guifg=#80deea guibg=NONE
    hi Delimiter guifg=#80deea guibg=NONE
    hi Number guifg=#80deea guibg=NONE
    hi CursorLineNR guifg=#80deea guibg=NONE
    hi Define guifg=#80deea guibg=NONE
    hi MoreMsg guifg=#80deea guibg=NONE
    hi Tag guifg=#80deea guibg=NONE
    hi String guifg=#80deea guibg=NONE
    hi MatchParen guifg=#80deea guibg=NONE
    hi Macro guifg=#80deea guibg=NONE
    hi DiffChange guifg=#80deea guibg=NONE
    hi GitGutterChange guifg=#80deea guibg=NONE
    hi cssColor guifg=#80deea guibg=NONE
    hi Function guifg=#00bcd4 guibg=NONE
    hi Directory guifg=#00acc1 guibg=NONE
    hi markdownLinkText guifg=#00acc1 guibg=NONE
    hi javaScriptBoolean guifg=#00acc1 guibg=NONE
    hi Include guifg=#00acc1 guibg=NONE
    hi Storage guifg=#00acc1 guibg=NONE
    hi cssClassName guifg=#00acc1 guibg=NONE
    hi cssClassNameDot guifg=#00acc1 guibg=NONE
    hi Statement guifg=#26c6da guibg=NONE
    hi Operator guifg=#26c6da guibg=NONE
    hi cssAttr guifg=#26c6da guibg=NONE


    hi Pmenu guifg=#00bcd4 guibg=#454545
    hi SignColumn guibg=#021012
    hi Title guifg=#00bcd4
    hi NonText guifg=#095b67 guibg=#021012
    hi Comment guifg=#095b67 gui=italic
    hi LineNr guifg=#095b67 guibg=#021012
    hi SpecialComment guifg=#095b67 gui=italic guibg=NONE
    hi CursorLine guibg=#454545
    hi TabLineFill gui=NONE guibg=#454545
    hi TabLine guifg=#000708 guibg=#454545 gui=NONE
    hi StatusLine gui=bold guibg=#454545 guifg=#00bcd4
    hi StatusLineNC gui=NONE guibg=#021012 guifg=#00bcd4
    hi Search guibg=#095b67 guifg=#00bcd4
    hi VertSplit gui=NONE guifg=#454545 guibg=NONE
    hi Visual gui=NONE guibg=#454545
]],
false)
