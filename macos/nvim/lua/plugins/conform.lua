-- 格式化（原 coding/nixvim/conform.nix）
-- 变化点：不再硬编码 nix 包路径，格式化器命令名走 PATH（mason/brew 提供，见 README）
-- nix 文件格式化 alejandra 已移除（macOS 无 nix），如需要 cargo install alejandra 后自行加回
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 600,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        bash = { "shfmt", "shellcheck", "shellharden" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        cmake = { "cmake_format" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        go = { "goimports" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        rust = { "rustfmt" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
        typst = { "typstyle" },
      },
    },
  },
}
