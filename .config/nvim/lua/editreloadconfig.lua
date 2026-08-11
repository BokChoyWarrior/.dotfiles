-- Custom commands for editing and reloading Neovim config

-- :EConf - Edit the Neovim config file
vim.api.nvim_create_user_command("EConf", function()
  local config_path = vim.fn.stdpath("config") .. "/init.lua"
  vim.cmd("edit " .. config_path)
end, { desc = "Edit Neovim config file" })

-- :RConf - Reload the Neovim config file
vim.api.nvim_create_user_command("RConf", function()
  -- Source all Lua files in the config directory
  local config_path = vim.fn.stdpath("config")
  vim.cmd("source " .. config_path .. "/init.lua")
  vim.api.nvim_out_write("Config reloaded!\n")
end, { desc = "Reload Neovim config file" })
