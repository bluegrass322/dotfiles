local plugins = {
  { "echasnovski/mini.indentscope" },
  { "nvim-lualine/lualine.nvim" },
  { "vimdev/dashboard-nvim" },
}

for i = 1, #plugins do
  plugins[i]["enabled"] = false
end
return plugins
