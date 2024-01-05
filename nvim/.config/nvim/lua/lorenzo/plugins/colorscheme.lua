return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme rose-pine")
    vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
  end,
}
