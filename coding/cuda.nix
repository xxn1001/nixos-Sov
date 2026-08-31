# GPU 驱动库路径注入（CUDA 专用）
#
# NixOS 的驱动库 libcuda.so 由 /run/opengl-driver（systemd tmpfiles 指向 nvidia 包）提供。
# pip/uv 安装的 torch 不带 Nix 的 driver runpath，必须靠 LD_LIBRARY_PATH 才能定位到它，
# 否则 torch.cuda.is_available() 永远返回 False。
#
# 注意：shell/fish.nix 里的 NIX_LD_LIBRARY_PATH 分支是"追加式"（不能改回覆盖式），
# 否则这里注入的路径会被清空。
{...}: {
  programs.fish.shellInit = ''
    for _d in /run/opengl-driver/lib /run/opengl-driver-32/lib
      if test -d $_d
        set -gx LD_LIBRARY_PATH $_d $LD_LIBRARY_PATH
      end
    end
  '';
}
