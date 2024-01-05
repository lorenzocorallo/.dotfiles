return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    require("telescope").setup({})
    pcall(require('telescope').load_extension, 'fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search Git [P]roject File" })
    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search [P]roject [F]ile" })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search [P]roject Grep" })
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word });
    end, { desc = "Search Current [W]ord in [P]roject" })
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word });
    end, { desc = "Search Current [W]ORD in [P]roject" })

    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "[V]iew [H]elp" })
    vim.keymap.set('n', '<leader>vk', builtin.keymaps, { desc = "[V]iew [K]eymaps" })
  end
}
