-- 通用键位（原 coding/nixvim/keymap.nix）

local map = vim.keymap.set

-- 智能行移动
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 缓冲区切换
map("n", "<leader>bn", "<cmd>bnext<CR>", { silent = true, desc = "下一个缓冲区" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { silent = true, desc = "上一个缓冲区" })

-- 保存/退出
map({ "i", "n", "v", "s" }, "<C-s>", "<Cmd>w<CR>", { silent = true, desc = "保存文件" })
map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "退出编辑器" })
map("n", "Q", "<cmd>bd<cr>", { silent = true, desc = "关闭缓冲区" })

-- 全选
map({ "i", "n" }, "<C-a>", "<Cmd>normal! ggVG<CR>", { silent = true, desc = "全选操作" })

-- 窗口大小调整
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增加窗口高度" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗口高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "减少窗口宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "增加窗口宽度" })

-- 窗口移动
map("n", "<leader>wH", "<C-w>H", { silent = true, desc = "窗口移到左边" })
map("n", "<leader>wJ", "<C-w>J", { silent = true, desc = "窗口移到底部" })
map("n", "<leader>wK", "<C-w>K", { silent = true, desc = "窗口移到顶部" })
map("n", "<leader>wL", "<C-w>L", { silent = true, desc = "窗口移到右边" })

-- 行移动
map("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "向下移动行" })
map("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "向上移动行" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "向下移动选择" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "向上移动选择" })

-- Tab 管理
map("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { silent = true, desc = "新建标签页" })
map("n", "<leader><tab>d", "<cmd>tabclose<CR>", { silent = true, desc = "关闭当前标签页" })
map("n", "<leader><tab>o", "<cmd>tabonly<CR>", { silent = true, desc = "关闭其他标签页" })
map("n", "<leader><tab>l", "<cmd>tabnext<CR>", { silent = true, desc = "切换到下一个标签页" })
map("n", "<leader><tab>h", "<cmd>tabprevious<CR>", { silent = true, desc = "切换到上一个标签页" })

-- 终端退出
map("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "终端退到Normal模式" })

-- 帮助查询
map("n", "<leader>H", "<CMD>Telescope help_tags theme=ivy layout_config={height=0.4}<CR>", {
  silent = true,
  desc = "帮助查询",
})

-- 切换
map("n", "<leader>ss", "<cmd>set spell!<cr>", { silent = true, desc = "切换拼写检查" })
map("n", "<leader>sd", "<cmd>lua ToggleDiagnostics()<CR>", { silent = true, desc = "切换语法诊断" })
