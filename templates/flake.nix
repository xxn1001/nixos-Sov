{
  description = "C++ 开发模板：通用开发 / 数据科学 / 机器学习与深度学习";

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
          cudaSupport = true;
        };
        overlays = [
          (final: prev: {
            onnxruntime = prev.onnxruntime.override {
              openvinoSupport = false;
            };
            cudaPackages = prev.cudaPackages.overrideScope (cudaFinal: cudaPrev: {
              "cudnn-frontend" = cudaPrev."cudnn-frontend".overrideAttrs (old: {
                preConfigure = (old.preConfigure or "") + ''
                  cmakeFlagsArray+=("-DCUDAToolkit_NVCC_EXECUTABLE=${cudaPrev.cuda_nvcc}/bin/nvcc")
                '';
              });
            });
          })
        ];
      };
    in {
      cpp-dev = import ./cpp-dev.nix { inherit pkgs; };
      cpp-ds = import ./cpp-ds.nix { inherit pkgs; };
      cpp-ml = import ./cpp-ml.nix { inherit pkgs; };
    });
  };
}
