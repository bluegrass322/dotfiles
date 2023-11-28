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
})

vim.cmd[[colorscheme iceberg]]

