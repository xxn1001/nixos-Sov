# nvim (macOS, lazy.nvim 版)

此目录是 `coding/nixvim` 的非 Nix 移植版，面向 macOS，使用 `lazy.nvim` 管理插件。
目录结构与原 nixvim 模块一一对应（见每个文件头部注释）。

## 使用方式

1. 启用并挂载：

```sh
brew install git ripgrep fd
ln -s ~/.config/nixos/macos/nvim ~/.config/nvim
```

（路径按你实际仓库位置调整，symlink 或复制均可）

2. 首次启动会自动 clone lazy.nvim 并安装全部插件；mason 会于启动后后台自动下载全部 LSP server，
   可在 `:Mason` 面板查看进度；如失败可执行 `:MasonInstallAll` 重试。
3. 安装一个 Nerd Font 并设为终端字体（`vim.g.have_nerd_font = true`）：

```sh
brew install --cask font-jetbrains-mono-nerd-font
```

4. Markdown 预览（markdown-preview.nvim）首次使用前：

```vim
:MarkdownPreviewInstall
```

## 与 nixvim 版的差别

| 项 | 说明 |
| --- | --- |
| `fcitx-vim` | 已移除（Linux 专属） |
| `wl-copy` 剪贴板 | 已移除；macOS 默认走 pbcopy/pbpaste |
| `lz-n` / combinePlugins / byteCompileLua | nixvim 打包机制，无对应 |
| `nixd` LSP | 已移除：macOS 无 nix；需要时可 `brew install nixd` 并恢复 `lspconfig.nixd.setup` |
| `alejandra` | 已移除；需要 nix 格式化的可 `cargo install alejandra` 后自行加回 `conform.nix` 对应项 |
| LSP server | 改为 mason 自动安装（原为 nix 包 + packageFallback） |
| Formatter 路径 | 由 nix 包绝对路径改为 PATH 命令名（mason/brew 提供） |
| `setupLspCapabilities` | 等价逻辑移入 `lua/plugins/lsp.lua` 的 `vim.lsp.config("*", ...)` |

## macOS 上格式化器依赖（mason 装不了的，按需安装）

conform 已全部按命令名解析，缺哪个就用哪个渠道装：

```sh
# brew
brew install shfmt shellcheck shellharden clang-format taplo

# npm（需要 node）
npm i -g prettier prettierd

# rustup / cargo
rustup component add rustfmt
cargo install alejandra typstyle

# go
brew install go
go install golang.org/x/tools/cmd/goimports@latest

# python（cmake-format / basedpyright 也可用 pipx）
pipx install cmakelang
```

## 主题

- everforest，`transparent_background = 2`（浮动窗口背景透明）+ 若干高亮组 `bg=NONE` 覆盖，
  位于 `lua/plugins/colorscheme.lua`。

## 维护说明

- 插件懒加载触发方式与原 nixvim `lazyLoad.settings.*` 对应：
  `cmd` → `cmd`，`event` → `event`，`ft` → `ft`，keys → `keys`。
- 自定义 `DeferredUIEnter`（nixvim 内部事件）已在 `lua/config/autocmds.lua` 定义发射器。
- 需 nvim >= 0.12（`vim.lsp.config` 自动合并 nvim-lspconfig 提供的 `lsp/*.lua` 默认配置），brew stable 即可。
  若使用 0.11：原生 API 可用，但各 server 的 filetypes/cmd 默认值不会自动合并，需自行在
  `lua/plugins/lsp.lua` 中为每个 server 补充 `vim.lsp.config(name, { filetypes = {...} })`。
