-- Trouble（原 coding/nixvim/trouble.nix）
return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      {
        "[q",
        function()
          local trouble = require("trouble")
          if trouble.is_open() then
            trouble.previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "上一个故障/快速修复项目",
      },
      {
        "]q",
        function()
          local trouble = require("trouble")
          if trouble.is_open() then
            trouble.next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "下一个故障/快速修复项目",
      },
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "切换诊断面板 (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "切换当前缓冲区诊断面板 (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "切换 LSP 引用面板 (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "切换位置列表面板 (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "切换 quickfix 列表面板 (Trouble)" },
    },
    opts = {},
  },
}
