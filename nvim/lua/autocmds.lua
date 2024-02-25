local command = vim.api.nvim_create_user_command

command("W", "w", {})
command("Q", "q", {})
command("WQ", "wq", {})
