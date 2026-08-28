{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./autocmd.nix
    ./keymap.nix
    ./colorscheme.nix
    ./lsp.nix
    ./conform.nix
    ./blink.nix
    ./lualine.nix
    ./treesitter.nix
    ./ufo.nix
    ./flash.nix
    ./ui.nix
    ./mini.nix
    ./noice.nix
    ./neo-tree.nix
    ./todo-comments.nix
    ./persistence.nix
    ./autotag.nix
    ./aerial.nix
    ./trouble.nix
    ./project.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    performance.combinePlugins.enable = false;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard.providers.wl-copy.enable = true;
      breakindent = true;
      tabstop = 2;
      shiftwidth = 2;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      hlsearch = false;
      scrolloff = 8;
      spell = true;
      spelllang = ["en_us" "cjk"];
      spellsuggest = "best,4";
      wrap = false;
      signcolumn = "yes";
      termguicolors = true;
      foldmethod = "expr";
      foldexpr = "v:lua.vim.ufo.foldexpr()";
      foldenable = true;
      foldlevelstart = 99;
      sessionoptions = ["buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds"];
    };
    plugins = {
      sleuth.enable = true;
      nvim-surround.enable = true;
      repeat.enable = true;
      lastplace.enable = true;
      nvim-autopairs.enable = true;
      endwise.enable = true;
      markdown-preview.enable = true;
      web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [fcitx-vim];
    extraConfigLua = ''
      function _G.ToggleDiagnostics()
        local enabled = vim.diagnostic.is_enabled()
        vim.diagnostic.enable(not enabled)
        vim.notify(enabled and "诊断已关闭" or "诊断已开启", vim.log.levels.INFO)
      end
    '';
  };
}
