-- Treesitter（原 coding/nixvim/treesitter.nix）
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      auto_install = false,
      ensure_installed = {
        "bash", "fish", "python", "yaml", "lua", "json", "nix",
        "regex", "toml", "vim", "markdown", "markdown_inline", "jsonc",
        "glsl", "css", "scss", "html", "hyprlang",
        "c", "cpp", "rust",
        "go", "gomod", "gowork",
        "javascript", "typescript", "tsx",
        "latex", "typst",
        "cmake", "make", "dockerfile",
        "diff", "git_config", "gitignore",
        "sql", "graphql",
        "query",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- 新版无 setup API，通过自身 FileType autocmd 自动附着；常驻避免错过第一个 buffer
    lazy = false,
  },
}
