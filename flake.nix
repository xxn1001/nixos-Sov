{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.home-manager.flakeModules.home-manager
      ];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        packages.default = pkgs.hello;
      };
      flake = {
        homeConfigurations."Sov" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
            host = "nixos";
            user = "Sov";
          };
          modules = [
            inputs.nixvim.homeModules.nixvim
            inputs.zen-browser.homeModules.default
            ({pkgs, ...}: {
              home.username = "Sov";
              home.homeDirectory = "/home/Sov";
              home.stateVersion = "26.05";
              nixpkgs.config.allowUnfree = true;
              nix.package = pkgs.nix;
              nix.settings.experimental-features = ["nix-command" "flakes"];
            })
            ./home.nix
            ./browser.nix
            ./terminal
            ./shell
            ./utils
            ./coding
          ];
        };
      };
    };
}
