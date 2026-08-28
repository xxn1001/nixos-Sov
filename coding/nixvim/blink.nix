let
  imapping = {
    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
    "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
    "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  };

  cmapping = {
    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'c'})";
    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'c'})";
    "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'c'})";
    "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'c'})";
    "<CR>" = "cmp.mapping.confirm({ select = true })";
  };
in {
  programs.nixvim = {
    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
          {name = "buffer";}
          {name = "path";}
          {name = "luasnip";}
          {name = "nvim_lsp";}
        ];
        mapping = imapping;
        window.completion.border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
      };
      cmdline = {
        "/" = {
          mapping = cmapping;
          sources = [
            {name = "buffer";}
          ];
        };
        ":" = {
          mapping = cmapping;
          sources = [
            {name = "path";}
            {name = "cmdline";}
          ];
        };
      };
    };
    plugins.cmp-buffer.enable = true;
    plugins.cmp-path.enable = true;
    plugins.luasnip.enable = true;
    plugins.cmp_luasnip.enable = true;
    plugins.cmp-nvim-lsp.enable = true;
    plugins.cmp-cmdline.enable = true;
    # plugins.cmp-spell.enable = true;
  };
}
