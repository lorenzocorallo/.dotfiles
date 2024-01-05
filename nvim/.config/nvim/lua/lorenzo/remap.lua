vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[V]iew [P]roject" })

-- set W as w (write)
vim.cmd([[cnoreabbrev W w]])

-- moving lines highlited
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up a line" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down a line" })

-- move page up-down staying in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go Page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go Page [U]p" })

-- search word staying in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- switch to prev file
vim.keymap.set("n", "<C-b>", "<Cmd>e#<CR>", { desc = "Go [B]ack" })

-- paste and delete don't lose yank
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete No Yank" })

-- system clipboard copy-to
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Suffering
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch tmux-sessionizer" })

-- chmod +x curr file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File E[x]ecutable" })

-- rename word under cursor
vim.keymap.set("n", "<leader>*", ":%s/<C-r><C-w>/", { desc = "Rename Current Word" })
