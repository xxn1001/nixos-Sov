{ pkgs }:

pkgs.mkShell {
  name = "cpp-dev";
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
  ];
  shellHook = ''
    echo "🔧 cpp-dev 环境就绪"
    echo "  gcc:   $(gcc --version 2>/dev/null | head -1)"
    echo "  cmake: $(cmake --version 2>/dev/null | head -1)"
    echo "  gdb:   $(gdb --version 2>/dev/null | head -1)"
  '';
}
