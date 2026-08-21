local opt = vim.opt

opt.showmode = false
opt.virtualedit = "block"
opt.signcolumn = 'yes'
opt.cursorline = true
opt.cursorcolumn = true
opt.cursorlineopt = "line"
-- opt.number = true
-- opt.relativenumber = true
opt.statuscolumn = "%s %{v:lnum} %{v:relnum} "
opt.termguicolors = false
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })
vim.api.nvim_set_hl(0, 'Cursorline', { ctermbg = 12 })
vim.api.nvim_set_hl(0, 'CursorColumn', { ctermbg = 12 })
vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'none' })
opt.foldenable = true
opt.foldmethod = 'expr'
opt.foldlevelstart = 99
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.linebreak = true
opt.wrap = true
opt.splitright = true
opt.list = true
opt.listchars = { tab = "| ", trail = "·", }
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftround = true
opt.shiftwidth = 0
opt.smartcase = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.undofile = true
opt.undolevels = 10000
opt.clipboard = "unnamedplus"
opt.confirm = true
vim.g.netrw_banner = 0
opt.mouse = ""
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
