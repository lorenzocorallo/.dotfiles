return {
  "tpope/vim-fugitive",
  keys = {
    "<leader>gs",
  },
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

    local group = require("lorenzo.autocmd").group
    local autocmd = require("lorenzo.autocmd").autocmd
    autocmd("BufWinEnter", {
      group = group,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()

        vim.keymap.set("n", "<leader>gpp", function()
          vim.cmd.Git("push")
        end, { desc = "[G]it [P]ush", buffer = bufnr, remap = false })

        vim.keymap.set("n", "<leader>gpP", ":Git push -u origin ", { desc = "[G]it [P]ush with --set-upstream", buffer = bufnr, remap = false });

        -- rebase always
        vim.keymap.set("n", "<leader>gpl", function()
          vim.cmd.Git({ "pull", "--rebase" })
        end, { desc = "[G]it [P]u[l]l (Rebase)", buffer = bufnr, remap = false })
      end,
    })
  end,
}
