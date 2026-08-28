{
  config.programs.nixvim = {
    colorscheme = "everforest";
    colorschemes.everforest = {
      enable = true;
      settings = {
        transparent_background = 2;
      };
    };
    highlightOverride = {
      Normal.bg = "NONE";
      NormalFloat.bg = "NONE";
      StatusLine.bg = "NONE";
      StatusLineNC.bg = "NONE";
      WinBar.bg = "NONE";
      WinBarNC.bg = "NONE";
      Pmenu.bg = "NONE";
      PmenuSbar.bg = "NONE";
      PmenuThumb.bg = "NONE";
      FloatBorder.bg = "NONE";
      TelescopeNormal.bg = "NONE";
      TelescopeBorder.bg = "NONE";
      NeoTreeNormal.bg = "NONE";
      NeoTreeNormalNC.bg = "NONE";
      SignColumn.bg = "NONE";
      LineNr.bg = "NONE";
      CursorLineNr.bg = "NONE";
      MsgArea.bg = "NONE";
    };
  };
}
