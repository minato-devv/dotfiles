vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.cursorlineopt = "line"
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %{v:lnum} %{v:relnum} "
vim.opt.termguicolors = false
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })
vim.api.nvim_set_hl(0, 'Cursorline', { ctermbg = 12 })
vim.api.nvim_set_hl(0, 'CursorColumn', { ctermbg = 12 })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none' })
vim.opt.foldmethod = 'marker'
vim.opt.foldlevelstart = 99
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "·", }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.g.netrw_banner = 0
vim.opt.mouse = ""
vim.g.mapleader = ' '

-- Normal mode mappings
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = "Move line down" })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = "Move line up" })

-- Visual mode mappings
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Prevent 'c', 's', and 'x' from overwriting the unnamed register
vim.keymap.set({'n', 'v'}, 'c', '"_c')
vim.keymap.set({'n', 'v'}, 's', '"_s')
vim.keymap.set({'n', 'v'}, 'x', '"_x')
