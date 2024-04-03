-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local options = {
  autoread = true,
  clipboard = "unnamedplus",
  conceallevel = 2,
  confirm = true,
  cursorline = true,
  expandtab = true,
  grepprg = "rg --vimgrep",
  ignorecase = true,
  incsearch = true,
  inccommand = "nosplit",
  laststatus = 2,
  hlsearch = true,
  number = true,
  pumblend = 10,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 4,
  shiftround = true,
  shiftwidth = 2,
  showmode = false,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  spelllang = "en,cjk",
  smartindent = true,
  splitbelow = true,
  splitright = true,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 200,
  undofile = true,
  undolevels = 1000,
  virtualedit = "block",
  wildmode = "longest:full,full",
  wrap = false,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end
