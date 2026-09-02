-- nvim config bootstrap: install lazy.nvim and load config/plugins.
-- Original nixvim source: coding/nixvim/ (this is the non-nix port, for macOS)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error("lazy.nvim 克隆失败，请检查 git 和网络")
  end
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.misc")

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "everforest" } },
  change_detection = { notify = false },
  checker = { enabled = false },
})
