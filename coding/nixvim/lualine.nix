{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
      };
      sections = {
        lualine_a = [{ __unkeyed = "mode"; fmt = "string.lower"; }];
        lualine_b = [
          { __unkeyed = "branch"; icon.__unkeyed = ""; }
          { __unkeyed = "diff"; }
        ];
        lualine_c = [{
          __unkeyed = "diagnostics";
          symbols = { error = " "; warn = " "; info = " "; hint = "󰝶 "; };
        }];
        lualine_x = [{
          __unkeyed = "filetype";
          colored = true;
        }];
        lualine_y = [{
          __unkeyed = "filename";
          file_status = true;
          path = 1;
        }];
        lualine_z = [{ __unkeyed = "location"; }];
      };
    };
  };
}
