-- 小插件合集（原 coding/nixvim/default.nix plugins 部分 + autotag.nix + todo-comments.nix）
-- 变化点：已移除 fcitx-vim（Linux 专属）
return {
  -- 缩进探测（无 lazyLoad 需求，始终加载）
  { "tpope/vim-sleuth", lazy = false },

  -- 括号包围 / 重复命令
  {
    "kylechui/nvim-surround",
    keys = { "cs", "ds", "ys" },
    opts = {},
  },
  { "tpope/vim-repeat", lazy = false },

  -- 光标恢复（原 lastplace）
  { "farmergreg/vim-lastplace", event = { "BufReadPost" } },

  -- 自动配对（原 nvim-autopairs）
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {},
  },
  { "tpope/vim-endwise", event = { "InsertEnter" } },

  -- Markdown 预览（首次运行需 :MarkdownPreviewInstall 下载二进制）
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      pcall(function()
        vim.fn["mkdp#util#install"]()
      end)
    end,
  },

  -- 图标
  { "nvim-tree/nvim-web-devicons", lazy = false },

  -- HTML/JSX 标签自动重命名（原 ts-autotag）
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "vue", "tsx", "svelte", "astro" },
    opts = {
      enable_close = false,
      enable_close_on_slash = false,
      enable_rename = true,
    },
  },

  -- TODO 注释（原 todo-comments.nix）
  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {
      signs = true,
    },
    keys = {
      { "<leader>ft", "<cmd>Telescope todo-comments todo theme=dropdown<cr>", desc = "TODO查询" },
    },
  },
}
