-- Telescope（原 coding/nixvim/ui.nix 的 telescope 部分 + keymap.nix 的 <leader>H）
-- 依赖 project.nvim / telescope-todo-comments.nvim 以注册对应扩展（见 project.lua / plugins/misc.lua）
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "ahmedkhalf/project.nvim" },
    },
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files theme=dropdown previewer=false layout_config={height=0.3}<CR>", desc = "查找文件" },
      { "<leader>fs", "<CMD>Telescope grep_string theme=ivy layout_config={height=0.4}<CR>", desc = "字符快搜" },
      { "<leader>fg", "<CMD>Telescope live_grep theme=ivy layout_config={height=0.4}<CR>", desc = "全局搜索" },
      { "<leader>fb", "<CMD>Telescope buffers layout_config={mirror=true,prompt_position=top,height=0.4,width=0.6} layout_strategy=vertical previewer=false<CR>", desc = "查看缓冲区" },
      { "<leader>fo", "<CMD>Telescope oldfiles theme=dropdown previewer=false layout_config={height=0.3}<CR>", desc = "历史文件" },
      { "<leader>fr", "<CMD>Telescope live_grep_args theme=ivy layout_config={height=0.4}<CR>", desc = "高级搜索" },
      { "<leader>fk", "<CMD>Telescope keymaps layout_config={width=0.8}<CR>", desc = "快捷键查询" },
    },
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<A-s>"] = require("telescope.actions").file_split,
              ["<A-v>"] = require("telescope.actions").file_vsplit,
              ["<A-t>"] = require("telescope.actions").file_tab,
            },
            n = {
              ["<A-s>"] = require("telescope.actions").file_split,
              ["<A-v>"] = require("telescope.actions").file_vsplit,
              ["<A-t>"] = require("telescope.actions").file_tab,
            },
          },
        },
      }
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("live_grep_args")
      pcall(require("telescope").load_extension, "projects")
      pcall(require("telescope").load_extension, "todo-comments")
    end,
  },
}
