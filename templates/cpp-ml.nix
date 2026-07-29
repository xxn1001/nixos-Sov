{ pkgs }:

pkgs.mkShell {
  name = "cpp-ml";
  buildInputs = with pkgs; [
    # 编译
    gcc cmake ninja pkg-config gnumake ccache
    # 调试
    gdb valgrind
    # 通用库
    boost fmt spdlog nlohmann_json curl openssl
    yaml-cpp toml11 eigen range-v3 cli11
    # 网络 / IO
    libuv zlib
    # 测试 / 基准
    catch2 gtest gbenchmark
    # 工具
    clang-tools cppcheck include-what-you-use bear

    # 数学 / 线性代数
    openblas lapack

    # ML / DL
    onnxruntime

    # CUDA（NVIDIA 专有，需 allowUnfree）
    cudaPackages.cudatoolkit
    cudaPackages.cudnn

    # Python（数据预处理 / 实验）
    python3 uv
  ];
  shellHook = ''
    export CUDA_PATH=${pkgs.cudaPackages.cudatoolkit}
    export CUDA_HOME=${pkgs.cudaPackages.cudatoolkit}
    export CUDNN_PATH=${pkgs.cudaPackages.cudnn}
    echo "🤖 cpp-ml 环境就绪 (CUDA)"
    echo "  gcc:     $(gcc --version 2>/dev/null | head -1)"
    echo "  cmake:   $(cmake --version 2>/dev/null | head -1)"
    echo "  python:  $(python3 --version 2>/dev/null)"
    echo "  nvcc:    $(${pkgs.cudaPackages.cudatoolkit}/bin/nvcc --version 2>/dev/null | tail -1)"
  '';
}
