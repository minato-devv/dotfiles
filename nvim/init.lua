-- Color options {{{
vim.opt.termguicolors = true
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }
require("catppuccin").setup({flavour = "macchiato",})
vim.cmd.colorscheme "catppuccin-nvim"
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE cterm=NONE]])
-- vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE cterm=NONE]])
-- }}}

-- Folding {{{
vim.opt.foldmethod = 'marker'
vim.opt.foldlevelstart = 99
-- }}}

-- StatusColumn {{{
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorlineopt = "line"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.statuscolumn = "%s %{v:lnum} %{v:relnum} "
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE cterm=NONE]])
vim.cmd([[highlight CursorLine guibg=NONE ctermbg=236 cterm=NONE]])
vim.cmd([[highlight CursorColumn guibg=NONE ctermbg=236 cterm=NONE]])
-- }}}

-- Edge of file behaviors {{{
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.splitright = true
-- }}}

-- Special Typing behaviors {{{
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "·", }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.smartcase = true
vim.opt.ignorecase = true
-- }}}

-- Additional options {{{
vim.opt.inccommand = 'split'
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.g.netrw_banner = 0
vim.opt.mouse = ""
-- }}}

-- Keybinds {{{
vim.g.mapleader = ' '
vim.keymap.set('n', '<A-w>', ':wq <CR>')
vim.keymap.set('n', '<A-q>', ':q! <CR>')
vim.keymap.set('n', '<leader>w', ':w <CR>')
vim.keymap.set('n', '<leader>s', ':w | so % <CR>')
-- vim.keymap.set('n', '<leader>gd', ':vsplit | terminal git diff % <CR>')
vim.keymap.set('n', '<A-k>', ':m .-2 <CR> ==')
vim.keymap.set('n', '<A-j>', ':m .+1 <CR> ==')
vim.keymap.set('v', '<A-k>', ':m .-2 <CR> ==')
vim.keymap.set('v', '<S-<>', '< <CR> ==')
-- }}}

vim.lsp.enable('pyright', 'lua_ls')
vim.diagnostic.config({ virtual_text = true })
