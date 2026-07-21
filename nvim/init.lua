vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.confirm = true
vim.o.linebreak = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.scrolloff = 20
vim.o.sidescrolloff = 20
vim.o.inccommand = 'split'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 0
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.undolevels = 10000
vim.g.netrw_banner = 0
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = true
vim.o.mouse = ""
vim.o.list = true
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.listchars = {
	tab = "▏ ",
	trail = "·",
	extends = "»",
	precedes = "«",
}
vim.o.background = 'dark'
vim.cmd("colorscheme lunaperche")
-- lunaperche delek pablo unokai zaibatsu
-- vim.pack.add({{src = "https://github.com/scottmckendry/cyberdream.nvim", name = "cyberdream"}})
-- require("cyberdream").setup({variant = "auto", transparent = true})
