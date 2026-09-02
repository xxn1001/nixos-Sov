-- LSP（原 coding/nixvim/lsp.nix）
-- 变化点：server 由 mason 自动安装；采用 nvim 原生 vim.lsp.config（nvim >= 0.12，
--         默认配置由 nvim-lspconfig 的 lsp/*.lua 自动合并）；nixd 已移除（macOS 无 nix）
return {
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    -- 注意：这里必须填 lspconfig 服务器名（非 mason 包名），
    -- mason-lspconfig 内部会映射到对应的 mason 包自动安装
    opts = {
      ensure_installed = {
        "clangd",
        "rust_analyzer",
        "ts_ls",
        "basedpyright",
        "ruff",
        "lua_ls",
        "gopls",
        "bashls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_language_server",
        "eslint",
        "tinymist",
        "jsonls",
        "taplo",
        "marksman",
        "yamlls",
        "cmake",
        "qmlls",
        "harper_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ci", "<cmd>Telescope lsp_implementations<cr>", desc = "查找实现" },
      { "<leader>cG", "<cmd>Telescope lsp_references<cr>", desc = "查找引用" },
      { "<leader>cw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "查找工作区符号" },
      { "<leader>cf", "<cmd>Telescope lsp_document_symbols<cr>", desc = "文件大纲" },
      { "<leader>c[", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "被调列表" },
      { "<leader>c]", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "调用列表" },
      { "<leader>ce", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "当前文件诊断" },
      { "<leader>cW", "<cmd>Telescope diagnostics<cr>", desc = "全局诊断" },
      { "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "打开当前行诊断浮窗" },
      { "<leader>cR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "重命名符号" },
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "代码操作" },
    },
    config = function()
      -- nvim-ufo 折叠能力（原 setupLspCapabilities）
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument = capabilities.textDocument or {}
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      vim.lsp.config("*", { capabilities = capabilities })

      -- 带自定义选项的 server（默认值来自 nvim-lspconfig 的 lsp/*.lua，此处仅做覆盖）
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--function-arg-placeholders=false",
        },
      })
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            checkOnSave = true,
            inlayHints = {
              typeHints = true,
              parameterHints = true,
              chainingHints = true,
            },
          },
        },
      })
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            hint = { enable = false },
          },
        },
      })
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              unusedparams = true,
              unreachable = true,
              unusedvariable = true,
            },
            staticcheck = true,
          },
        },
      })
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                { "docker-compose.{yml,yaml}", "*compose*.{yml,yaml}" },
            },
          },
        },
      })

      vim.lsp.enable({
        "clangd",
        "rust_analyzer",
        "basedpyright",
        "lua_ls",
        "gopls",
        "yamlls",
        "cmake",
        "bashls",
        "ts_ls",
        "ruff",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_language_server",
        "eslint",
        "tinymist",
        "jsonls",
        "taplo",
        "marksman",
        "qmlls",
        "harper_ls",
      })

      -- inlay hints（原 lsp.inlayHints.enable）
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.lsp.inlay_hint.enable(true)
        end,
      })

      -- LSP 兜底启动（懒加载竞态）
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "LSP 兜底启动（懒加载竞态）",
        callback = function(ev)
          local bufnr = ev.buf
          if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
            return
          end
          local ft = vim.bo[bufnr].filetype
          if ft == "" or vim.b[bufnr].lsp_kick_done then
            return
          end
          vim.b[bufnr].lsp_kick_done = true
          local function kick(left)
            if left <= 0 or not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].filetype ~= ft then
              return
            end
            if #vim.lsp.get_clients({ bufnr = bufnr }) > 0 then
              return
            end
            local pending = false
            for name in pairs(vim.lsp._enabled_configs or {}) do
              if #vim.lsp.get_clients({ bufnr = bufnr, name = name }) == 0 then
                local config = vim.lsp.config[name]
                local fts = config and config.filetypes
                if type(fts) == "table" and #fts > 0 and vim.tbl_contains(fts, ft) then
                  local before = #vim.lsp.get_clients({ bufnr = bufnr, name = name })
                  local ok = pcall(vim.lsp.start, config, { bufnr = bufnr })
                  if ok and #vim.lsp.get_clients({ bufnr = bufnr, name = name }) > before then
                    return
                  end
                end
                pending = true
              end
            end
            if pending then
              vim.defer_fn(function()
                kick(left - 1)
              end, 150)
            end
          end
          vim.schedule(function()
            kick(12)
          end)
        end,
      })

      -- 去重跳转（gd/gD/gt/gI）
      local function dedupe_jump(method, desc)
        return function()
          vim.lsp.buf[method]({
            on_list = function(olist)
              local seen = {}
              local items = {}
              for _, it in ipairs(olist.items) do
                local key = (it.filename or "") .. ":" .. (it.lnum or 0) .. ":" .. (it.col or 0)
                if not seen[key] then
                  seen[key] = true
                  table.insert(items, it)
                end
              end
              if #items == 0 then
                vim.notify("No locations found", vim.log.levels.INFO)
                return
              end
              if #items == 1 then
                local it = items[1]
                local b = it.bufnr or vim.fn.bufadd(it.filename)
                vim.bo[b].buflisted = true
                vim.cmd("normal! m'")
                vim.api.nvim_win_set_buf(0, b)
                vim.api.nvim_win_set_cursor(0, { it.lnum, (it.col or 1) - 1 })
                vim.cmd("normal! zv")
                return
              end
              vim.ui.select(items, {
                prompt = "选择跳转目标",
                format_item = function(it)
                  local f = it.filename or ""
                  return string.format("%s:%d:%d", vim.fn.fnamemodify(f, ":~:."), it.lnum or 0, it.col or 0)
                end,
              }, function(choice)
                if choice then
                  local b = choice.bufnr or vim.fn.bufadd(choice.filename)
                  vim.bo[b].buflisted = true
                  vim.cmd("normal! m'")
                  vim.api.nvim_win_set_buf(0, b)
                  vim.api.nvim_win_set_cursor(0, { choice.lnum, (choice.col or 1) - 1 })
                  vim.cmd("normal! zv")
                end
              end)
            end,
          })
        end
      end

      vim.keymap.set("n", "gd", dedupe_jump("definition", "跳转到定义"), { desc = "跳转到定义" })
      vim.keymap.set("n", "gD", dedupe_jump("declaration", "跳转到声明"), { desc = "跳转到声明" })
      vim.keymap.set("n", "gt", dedupe_jump("type_definition", "跳转到类型定义"), { desc = "跳转到类型定义" })
      vim.keymap.set("n", "gI", dedupe_jump("implementation", "跳转到实现"), { desc = "跳转到实现" })

      -- 诊断外观
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local _border = "rounded"
          vim.diagnostic.config({
            virtual_text = true,
            signs = {
              active = true,
              text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.INFO] = "",
                [vim.diagnostic.severity.HINT] = "💡",
              },
            },
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
              border = _border,
            },
          })
        end,
      })
    end,
  },
}
