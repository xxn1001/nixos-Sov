{
  pkgs,
  inputs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      palette = "catppuccin_macchiato";

      format = ''
        [░▒▓]($style)\
        [  ](bg:#8aadf4 fg:#24273a)\
        $os\
        $username\
        [](bg:#a6da95 fg:#8aadf4)\
        $directory\
        [](fg:#a6da95 bg:#eed49f)\
        $git_branch\
        $git_status\
        [](fg:#eed49f bg:#7dc4e4)\
        $c\
        $rust\
        $golang\
        $python\
        $nodejs\
        [](fg:#7dc4e4 bg:#b7bdf8)\
        $docker_context\
        [](fg:#b7bdf8 bg:#24273a)\
        $nix_shell\
        [](fg:#24273a)\
        $fill\
        $cmd_duration\
        $line_break\
        $character
      '';

      palettes.catppuccin_macchiato = {
        rosewater = "#f4dbd6";
        flamingo = "#f0c6c6";
        pink = "#f5bde6";
        mauve = "#c6a0f6";
        red = "#ed8796";
        maroon = "#ee99a0";
        peach = "#f5a97f";
        yellow = "#eed49f";
        green = "#a6da95";
        teal = "#8bd5ca";
        sky = "#91d7e3";
        sapphire = "#7dc4e4";
        blue = "#8aadf4";
        lavender = "#b7bdf8";
        text = "#cad3f5";
        subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb";
        overlay2 = "#939ab7";
        overlay1 = "#8087a2";
        overlay0 = "#6e738d";
        surface2 = "#5b6078";
        surface1 = "#494d64";
        surface0 = "#363a4f";
        base = "#24273a";
        mantle = "#1e2030";
        crust = "#181926";
      };

      os.disabled = false;
      os.format = "[ $symbol]($style)";

      username.show_always = true;
      username.format = "[ $user]($style)";

      directory.truncation_length = 3;
      directory.format = "[ $path]($style)[$read_only]($read_only_style)";

      git_branch.format = "[ $symbol$branch]($style)";
      git_branch.style = "bg:#eed49f fg:#24273a";

      git_status.format = "([$all_status$ahead_behind]($style))";
      git_status.style = "bg:#eed49f fg:#24273a";

      nix_shell.format = "[ $symbol$name]($style)";
      nix_shell.style = "bg:#24273a fg:#8aadf4";

      cmd_duration.format = "[  $duration]($style)";
      cmd_duration.style = "fg:#6e738d";

      fill.symbol = " ";

      character.success_symbol = "[❯](bold green)";
      character.error_symbol = "[❯](bold red)";
      character.vimcmd_symbol = "[❮](bold green)";
    };
  };
}
