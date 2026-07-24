{
  pkgs,
  lib,
  user,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      # files
      zip
      xz
      unzip

      # utils
      ripgrep
      zoxide
      fzf
      eza
      fd
    ];

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        qt6Packages.fcitx5-chinese-addons
        fcitx5-rime
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
      ];
      waylandFrontend = true;
    };
  };

  programs = {
    git = {
      enable = true;
      signing.format = "openpgp";
      settings = {
        user = {
          name = "xxn1001";
          email = "davesovvv@gmail.com";
        };
        url = {
          "git@github.com:" = {
            insteadOf = "https://github.com/";
          };
        };
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
    };
    home-manager.enable = true;
  };
}
