require("commands")
require("keymaps")
require("netrw")
require("options")

require("lazy_nvim")

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
