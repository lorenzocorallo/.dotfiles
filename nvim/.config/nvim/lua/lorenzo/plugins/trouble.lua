return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup()
    vim.keymap.set('n', '<leader>tt', require("trouble").toggle,
      { desc = "[T]rouble: [T]oggle List" }
    )
    vim.keymap.set('n', '<leader>tn', function()
      require("trouble").next({
        jump = true,
        skip_groups = true,
      })
    end, { desc = "[T]rouble: [N]ext Diagnostic" })
    vim.keymap.set('n', '<leader>tp', function()
      require("trouble").previous({
        jump = true,
        skip_groups = true,
      })
    end, { desc = "[T]rouble: [P]revious Diagnostic" })
  end
}
