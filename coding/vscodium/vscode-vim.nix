{
  programs.vscodium.profiles.default.userSettings = {
    # ====================================================================
    # VSCodeVim 核心设置（对齐 nixvim 习惯）
    # ====================================================================

    "vim.leader" = " ";
    "vim.useSystemClipboard" = true;
    "vim.useCtrlKeys" = true;
    "vim.hlsearch" = true;
    "vim.ignorecase" = true;
    "vim.smartcase" = true;
    "vim.incsearch" = true;
    "vim.showmodename" = false;
    "vim.smartRelativeLine" = true;
    "vim.timeout" = 300;
    "vim.statusBarColorControl" = false;
    "vim.statusBarColors.normal" = [ "#8FBCBB" "#1F2335" ];
    "vim.statusBarColors.insert" = [ "#BF616A" "#1F2335" ];
    "vim.statusBarColors.visual" = [ "#B48EAD" "#1F2335" ];
    "vim.statusBarColors.visualline" = [ "#B48EAD" "#1F2335" ];
    "vim.statusBarColors.visualblock" = [ "#B48EAD" "#1F2335" ];
    "vim.statusBarColors.replace" = [ "#D08770" "#1F2335" ];
    "vim.statusBarColors.commandlineinprogress" = [ "#EBCB8B" "#1F2335" ];
    "vim.highlightedyank.enable" = true;
    "vim.highlightedyank.duration" = 500;

    # Ctrl 键让 VSCode 原生处理（对齐 nixvim 习惯）
    "vim.handleKeys" = {
      "<C-a>" = false; # 全选
      "<C-s>" = false; # 保存
      "<C-q>" = false; # 注释
      "<C-p>" = false; # 快速打开
      "<C-f>" = false; # 搜索
      "<C-b>" = false; # 侧栏切换
      "<C-j>" = false; # 面板切换
      "<C-z>" = false; # 撤销
      "<C-w>" = false; # 关闭编辑器 / 分屏
    };

    # ====================================================================
    # Normal 模式键位（对齐 nixvim keymap.nix + vscode-nvim init.lua）
    # ====================================================================

    "vim.normalModeKeyBindingsNonRecursive" = [
      # --- 保存 / 退出 / 缓冲 ---
      {
        before = [ "Q" ];
        commands = [{ command = "workbench.action.closeActiveEditor"; }];
      }
      {
        before = [ "<leader>" "b" "n" ];
        commands = [{ command = "workbench.action.nextEditor"; }];
      }
      {
        before = [ "<leader>" "b" "p" ];
        commands = [{ command = "workbench.action.previousEditor"; }];
      }
      {
        before = [ "<leader>" "q" "q" ];
        commands = [{ command = "workbench.action.closeAllEditors"; }];
      }

      # --- 行移动（Alt+j/k = VSCode 行移动命令）---
      {
        before = [ "<A-j>" ];
        commands = [{ command = "editor.action.moveLinesDownAction"; }];
      }
      {
        before = [ "<A-k>" ];
        commands = [{ command = "editor.action.moveLinesUpAction"; }];
      }

      # --- LSP 跳转 ---
      {
        before = [ "g" "d" ];
        commands = [{ command = "editor.action.revealDefinition"; }];
      }
      {
        before = [ "g" "r" ];
        commands = [{ command = "references-view.findReferences"; }];
      }
      {
        before = [ "g" "D" ];
        commands = [{ command = "editor.action.revealDeclaration"; }];
      }
      {
        before = [ "g" "I" ];
        commands = [{ command = "editor.action.goToImplementation"; }];
      }
      {
        before = [ "g" "t" ];
        commands = [{ command = "editor.action.goToTypeDefinition"; }];
      }
      {
        before = [ "K" ];
        commands = [{ command = "editor.action.showHover"; }];
      }

      # --- LSP 代码操作 <leader>c ---
      {
        before = [ "<leader>" "c" "R" ];
        commands = [{ command = "editor.action.rename"; }];
      }
      {
        before = [ "<leader>" "c" "a" ];
        commands = [{ command = "editor.action.quickFix"; }];
      }
      {
        before = [ "<leader>" "c" "f" ];
        commands = [{ command = "workbench.action.gotoSymbol"; }];
      }
      {
        before = [ "<leader>" "c" "w" ];
        commands = [{ command = "workbench.action.showAllSymbols"; }];
      }
      {
        before = [ "<leader>" "c" "i" ];
        commands = [{ command = "editor.action.goToImplementation"; }];
      }
      {
        before = [ "<leader>" "c" "G" ];
        commands = [{ command = "references-view.findReferences"; }];
      }

      # --- 诊断导航 ---
      {
        before = [ "[" "d" ];
        commands = [{ command = "editor.action.marker.prev"; }];
      }
      {
        before = [ "]" "d" ];
        commands = [{ command = "editor.action.marker.next"; }];
      }
      {
        before = [ "<leader>" "c" "e" ];
        commands = [{ command = "workbench.action.showErrorsWarnings"; }];
      }
      {
        before = [ "<leader>" "c" "W" ];
        commands = [{ command = "workbench.panel.markers.view.focus"; }];
      }
      {
        before = [ "<leader>" "c" "d" ];
        commands = [{ command = "editor.action.peekProblem"; }];
      }

      # --- 文件 / 搜索 / UI <leader>f ---
      {
        before = [ "<leader>" "f" "f" ];
        commands = [{ command = "workbench.action.quickOpen"; }];
      }
      {
        before = [ "<leader>" "f" "g" ];
        commands = [{ command = "workbench.action.findInFiles"; }];
      }
      {
        before = [ "<leader>" "f" "s" ];
        commands = [{ command = "workbench.action.findInFiles"; }];
      }
      {
        before = [ "<leader>" "f" "b" ];
        commands = [{ command = "workbench.action.showAllEditors"; }];
      }
      {
        before = [ "<leader>" "f" "o" ];
        commands = [{ command = "workbench.action.openRecent"; }];
      }
      {
        before = [ "<leader>" "f" "p" ];
        commands = [{ command = "workbench.action.openRecent"; }];
      }
      {
        before = [ "<leader>" "f" "k" ];
        commands = [{ command = "workbench.action.openGlobalKeybindings"; }];
      }
      {
        before = [ "<leader>" "e" ];
        commands = [{ command = "workbench.view.explorer"; }];
      }

      # --- 诊断面板 <leader>x ---
      {
        before = [ "<leader>" "x" "x" ];
        commands = [{ command = "workbench.actions.view.problems"; }];
      }
      {
        before = [ "<leader>" "x" "X" ];
        commands = [{ command = "workbench.panel.markers.view.focus"; }];
      }

      # --- 命令面板（空格+冒号 = VSCode 命令面板）---
      {
        before = [ "<leader>" ":" ];
        commands = [{ command = "workbench.action.showCommands"; }];
      }

      # --- Git ---
      {
        before = [ "]" "c" ];
        commands = [{ command = "editor.action.dirtydiff.next"; }];
      }
      {
        before = [ "[" "c" ];
        commands = [{ command = "editor.action.dirtydiff.previous"; }];
      }
      {
        before = [ "<leader>" "h" "p" ];
        commands = [{ command = "git.openChange"; }];
      }
      {
        before = [ "<leader>" "h" "b" ];
        commands = [{ command = "git.toggleBlame"; }];
      }
      {
        before = [ "<leader>" "h" "d" ];
        commands = [{ command = "git.openChange"; }];
      }
      {
        before = [ "<leader>" "h" "t" ];
        commands = [{ command = "git.toggleBlame"; }];
      }

      # --- Tab 管理 <leader><tab> ---
      {
        before = [ "<leader>" "<tab>" "<tab>" ];
        commands = [{ command = "workbench.action.newGroupBelow"; }];
      }
      {
        before = [ "<leader>" "<tab>" "d" ];
        commands = [{ command = "workbench.action.closeActiveEditor"; }];
      }
      {
        before = [ "<leader>" "<tab>" "l" ];
        commands = [{ command = "workbench.action.nextEditor"; }];
      }
      {
        before = [ "<leader>" "<tab>" "h" ];
        commands = [{ command = "workbench.action.previousEditor"; }];
      }

      # --- 切换 ---
      {
        before = [ "<leader>" "s" "s" ];
        after = [ ":" "s" "e" "t" " " "s" "p" "e" "l" "l" "!" "<Enter>" ];
      }
    ];

    # ====================================================================
    # Visual 模式键位
    # ====================================================================

    "vim.visualModeKeyBindingsNonRecursive" = [
      # 行移动（Alt+j/k）
      {
        before = [ "<A-j>" ];
        commands = [{ command = "editor.action.moveLinesDownAction"; }];
      }
      {
        before = [ "<A-k>" ];
        commands = [{ command = "editor.action.moveLinesUpAction"; }];
      }
    ];

    # ====================================================================
    # 其他 Vim 行为设置
    # ====================================================================

    # 允许在补全可见时用 Tab/Shift+Tab 选择建议
    "vim.overrideCopy" = false;
    "vim.textwidth" = 0;
    "vim.cursorStylePerMode.normal" = "block";
    "vim.cursorStylePerMode.insert" = "line";
    "vim.cursorStylePerMode.replace" = "underline";
    "vim.cursorStylePerMode.visual" = "block";
    "vim.cursorStylePerMode.visualline" = "block";
    "vim.cursorStylePerMode.visualblock" = "block";
  };
}
