{ pkgs }:

pkgs.mkShell {
  name = "cpp-ds";
  buildInputs = with pkgs; [
    # 编译
    gcc cmake ninja pkg-config gnumake ccache
    # 调试
    gdb valgrind
    # 通用库
    boost fmt spdlog nlohmann_json curl openssl
    # 配置 / 序列化
    yaml-cpp toml11 cli11
    # 数学 / 线性代数
    eigen openblas lapack range-v3
    # 列式数据 / 文件格式
    arrow-cpp hdf5 protobuf
    # 数据库
    sqlite
    # 网络 / IO
    libuv zlib
    # 测试 / 基准
    catch2 gtest gbenchmark
    # 工具
    clang-tools cppcheck include-what-you-use bear
    # 数据探索
    python3 uv
  ];
  shellHook = ''
    echo "📊 cpp-ds 环境就绪"
    echo "  gcc:    $(gcc --version 2>/dev/null | head -1)"
    echo "  cmake:  $(cmake --version 2>/dev/null | head -1)"
    echo "  arrow:  $(pkg-config --modversion arrow 2>/dev/null || echo 'N/A')"
    echo "  python: $(python3 --version 2>/dev/null)"
  '';
}
