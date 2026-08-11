package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.syntax = "on"

vim.cmd("filetype plugin indent on")
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.opt.modeline = true
vim.opt.autochdir = true


require('editreloadconfig')

vim.pack.add({
	{src = "https://github.com/vague2k/vague.nvim"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
})

require('vague').setup({ italic = false })
vim.cmd("colorscheme vague")

vim.lsp.enable({"lua_ls"})

