{pkgs}:
pkgs.mkShell {
  name = "cuda-dev";
  buildInputs = with pkgs; [
    # 编译
    gcc
    cmake
    ninja
    pkg-config
    gnumake
    ccache

    # CUDA 工具链（官方推荐细粒度 redistributables，不用 cudatoolkit 合并包）
    cudaPackages.cuda_nvcc
    cudaPackages.cuda_cudart
    cudaPackages.cudnn
    cudaPackages.nccl

    # Python（数据处理 / 编译扩展）
    python3
  ];
  shellHook = ''
    export CUDA_PATH=${pkgs.cudaPackages.cuda_nvcc}
    export CUDA_HOME=${pkgs.cudaPackages.cuda_nvcc}
    export CUDNN_PATH=${pkgs.cudaPackages.cudnn}
    export NCCL_PATH=${pkgs.cudaPackages.nccl}
    echo "cuda-dev 环境就绪（编译 CUDA 扩展用）"
    echo "  nvcc: $(${pkgs.cudaPackages.cuda_nvcc}/bin/nvcc --version 2>/dev/null | tail -1)"
    echo "  编译产物运行时靠全局 LD_LIBRARY_PATH（已含 /run/opengl-driver/lib）"
    # nix develop 固定用 bashInteractive，这里直接亮出用户自己的 fish
    if test -z "$NIX_DEVELOP_NO_FISH"; then
      exec fish
    fi
  '';
}
