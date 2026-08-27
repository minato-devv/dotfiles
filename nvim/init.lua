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
vim.api.nvim_set_hl(0, 'Cursorline', { ctermbg = 6 })
vim.api.nvim_set_hl(0, 'CursorColumn', { ctermbg = 6 })
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
opt.listchars = { tab = "⇥ ", trail = "·", }
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

vim.g.mapleader = " "
vim.g.localleader = ","

-- vim.pack.add { "https://github.com/lervag/vimtex" }
-- vim.g.vimtex_view_method = "general"

vim.pack.add { "https://github.com/neovim/nvim-lspconfig"}
vim.diagnostic.config({
  severity_sort = true,                -- errors above warnings above info
  virtual_text = {
    spacing = 2,
    source = "if_many",                -- show the source name when more than one
    prefix = "●",                      -- the marker in front of each message
  },
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN]  = "W",
      [vim.diagnostic.severity.INFO]  = "I",
      [vim.diagnostic.severity.HINT]  = "H",
    },
  },
})
vim.lsp.enable("pyright")
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end
    map("n", "K",     vim.lsp.buf.hover,        "Hover")
    map("n", "gd",    vim.lsp.buf.definition,   "Go to definition")
    map("n", "gD",    vim.lsp.buf.declaration,  "Go to declaration")
    map("n", "gi",    vim.lsp.buf.implementation,"Go to implementation")
    map("n", "gr",    vim.lsp.buf.references,   "Find references")
    map("n", "<leader>rn", vim.lsp.buf.rename,  "Rename symbol")
    map({ "n", "v" }, "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, "Code action")
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")
  end,
})
