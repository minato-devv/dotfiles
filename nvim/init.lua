vim.opt.virtualedit = "block"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.mouse = ""

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = "Move line down" })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = "Move line up" })

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
