{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    fish = {
      enable = true;
      shellAbbrs = {
        nixu = "nh os switch --ask";
        homeu = "nh home switch --ask";
        cd = "z";
      };
      shellAliases = {
        "ls" = "eza";
        "l" = "eza -lah --icons=auto";
        "nv" = "nvim";
      };
      shellInit = ''
        zoxide init fish | source
        export PATH="$HOME/.local/bin:$PATH"

        if test -n "$container"
          export PATH="$HOME/.local/bin:$PATH"
          eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
        end

        if set -q NIX_LD_LIBRARY_PATH
          set -gx LD_LIBRARY_PATH $NIX_LD_LIBRARY_PATH
        end

        set -g fish_color_command = blue --italics
        set -g fish_color_quote = yellow --italics
      '';
      plugins = with pkgs.fishPlugins; [
        {
          name = "puffer";
          src = puffer.src;
        }
        {
          name = "pisces";
          src = pisces.src;
        }
      ];
      functions = {
        fish_greeting = "";
      };
    };
  };
  programs.man.generateCaches = false;
}
