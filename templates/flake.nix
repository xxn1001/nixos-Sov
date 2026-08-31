{
  description = "开发模板：C++ / CUDA 工具链 / Python 数据科学与深度学习";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {self, nixpkgs}: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in {
      cpp-dev = import ./cpp-dev.nix { inherit pkgs; };
      cuda-dev = import ./cuda-dev.nix { inherit pkgs; };
    });
  };
}
