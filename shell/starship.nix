{
  pkgs,
  inputs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      palette = "noctalia";
      add_newline = false;

      format = ''
$cmd_duration 󰜥 $directory $git_branch
$character'';

      character = {
        success_symbol = "[   ](bold fg:blue)";
        error_symbol = "[   ](bold fg:red)";
      };

      package = {
        disabled = true;
      };

      git_branch = {
        style = "bg: cyan";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = "󰜥 [](bold fg:cyan)[$symbol $branch(:$remote_branch)](fg:black bg:cyan)[ ](bold fg:cyan)";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = "[\\($state( $progress_current of $progress_total)\\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\\($count\\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };

      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan)";
        trim_at = ".companyname.com";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      memory_usage = {
        disabled = true;
        threshold = -1;
        symbol = " ";
        style = "bold dimmed green";
      };

      time = {
        disabled = true;
        format = "🕙[\\[ $time \\]]($style) ";
        time_format = "%T";
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:green fg:black";
        truncation_length = 6;
        truncation_symbol = " ••/";
        format = "[](bold fg:green)[󰉋 $path]($style)[](bold fg:green)";
        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = " 󰊤 ";
        };
      };

      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:yellow)[󰪢 $duration](bold bg:yellow fg:black)[](bold fg:yellow)";
      };

      palettes = {
        ii = {
          primary = "#B6C9D7";
          onPrimary = "#21323E";
          secondary = "#C1C7CD";
          onSecondary = "#2B3136";
          tertiary = "#D3C0D6";
          onTertiary = "#392C3D";
          surface = "#131414";
          onSurface = "#E3E2E3";
          background = "#1D1E1E";
          foreground = "#E3E2E3";
          black = "#1D1E1E";
          red = "#AD979E";
          green = "#8DB6A4";
          yellow = "#BEB4A1";
          blue = "#91A6B6";
          magenta = "#A59EB1";
          cyan = "#9AAFBA";
          white = "#ACAAA5";
          bright_black = "#8F9194";
          bright_red = "#F0D5D8";
          bright_green = "#DBF8E2";
          bright_yellow = "#FAF2C3";
          bright_blue = "#E7EEF5";
          bright_magenta = "#ECE2F2";
          bright_cyan = "#DEF5F7";
          bright_white = "#E3E2E3";
        };

        noctalia = {
          blue = "#feacef";
          red = "#ffb4ab";
          green = "#c4c0ff";
          yellow = "#c6c3e9";
          cyan = "#c6c3e9";
          magenta = "#c4c0ff";
          white = "#e5e1e9";
          black = "#474551";
          rosewater = "#c6c3e9";
          flamingo = "#ffb4ab";
          pink = "#c4c0ff";
          mauve = "#c4c0ff";
          maroon = "#ffb4ab";
          peach = "#c6c3e9";
          teal = "#c6c3e9";
          sky = "#c6c3e9";
          sapphire = "#feacef";
          lavender = "#c4c0ff";
          text = "#e5e1e9";
          subtext1 = "#e5e1e9";
          subtext0 = "#928f9c";
          overlay2 = "#928f9c";
          overlay1 = "#928f9c";
          overlay0 = "#474551";
          surface2 = "#474551";
          surface1 = "#474551";
          surface0 = "#131318";
          base = "#131318";
          mantle = "#131318";
          crust = "#131318";
        };
      };
    };
  };
}
