-- 杂项全局函数（原 coding/nixvim/default.nix extraConfigLua）

_G.ToggleDiagnostics = function()
  local enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not enabled)
  vim.notify(enabled and "诊断已关闭" or "诊断已开启", vim.log.levels.INFO)
end
