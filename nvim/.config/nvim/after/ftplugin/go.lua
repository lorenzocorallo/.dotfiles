local termCmdAutofocus = function(cmd)
  return function()
    vim.cmd(cmd)
    vim.cmd("wincmd p")
    vim.cmd("startinsert")
  end
end

vim.keymap.set("n", "<leader>Gta", ":GoAddTags<CR>", { desc = "Go: [T]ags [A]dd" })
vim.keymap.set("n", "<leader>Gtr", ":GoRemoveTags<CR>", { desc = "Go: [T]ags [R]emove" })
vim.keymap.set("n", "<leader>GB", ":GoBuild<CR>", { desc = "Go: [B]uild" })
vim.keymap.set("n", "<leader>GTa", ":GoTest<CR>", { desc = "Go: [T]est [A]ll" })
vim.keymap.set("n", "<leader>GR", termCmdAutofocus(":GoRun<CR>"), { desc = "Go: [R]un" })
vim.keymap.set("n", "<leader>GTf", termCmdAutofocus(":GoTestFunc<CR>"), { desc = "Go: [T]est Single [F]unction" })
vim.keymap.set("n", "<leader>Gmt", function()
  local output = vim.fn.system("go mod tidy")
  print(output)
  vim.cmd("LspRestart")
end, { desc = "Go: [M]od [T]idy" })

-- vim.go config --
vim.g.go_addtags_transform = "camelcase"
vim.g.go_fmt_autosave = 0
vim.g.go_mod_fmt_autosave = 0
vim.g.go_imports_autosave = 0
vim.g.go_doc_keywordprg_enabled = 0 -- fuck nnoremap K -> :GoDoc (i want my hover remap)

vim.g.go_doc_popup_window = 1
vim.g.go_term_enabled = 1
vim.g.go_term_mode = "split"
-- END --
