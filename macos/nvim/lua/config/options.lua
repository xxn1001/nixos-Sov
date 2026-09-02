-- 全局选项（原 coding/nixvim/default.nix opts 部分）
-- 已移除：clipboard.providers.wl-copy（Linux 专属，macOS 走 pbcopy）

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "cjk" }
vim.opt.spellsuggest = "best,4"
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.ufo.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
