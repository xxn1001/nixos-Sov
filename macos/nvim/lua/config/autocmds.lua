-- 自动命令（原 coding/nixvim/autocmd.nix）
-- 额外补充了 DeferredUIEnter 事件发射器（nixvim 内部提供，macOS 版需自行定义）

vim.api.nvim_create_augroup("highlight-yank", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  desc = "取消自动换行注释",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "部分文档文件开启自动软换行并添加中文符号作为换行标志",
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakat:append("，。！？；：")
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "复制高亮",
  pattern = "*",
  group = "highlight-yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "noice背景颜色设置",
  pattern = "*",
  callback = function()
    local bg = vim.api.nvim_get_hl_by_name("Normal", true).background
    if bg then
      bg = string.format("#%06x", bg)
    else
      bg = "#000000"
    end
    vim.cmd("highlight NotifyBackground guibg=" .. bg)
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "自定义事件CookLazy",
  once = true,
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "CookLazy" })
    end)
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  desc = "自定义事件LazyFile",
  once = true,
  callback = function()
    if not vim.g._lazyfile_triggered then
      vim.g._lazyfile_triggered = true
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "自定义事件DeferredUIEnter",
  once = true,
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "DeferredUIEnter" })
    end)
  end,
})
