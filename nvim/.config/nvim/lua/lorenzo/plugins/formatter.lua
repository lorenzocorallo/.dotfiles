return {
  "mhartington/formatter.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "cs",
    "lua",
  },
  config = function()
    -- local util = require("formatter.util")

    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },

        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },

        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier,
        },

        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },

        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier,
        },

        cs = {
          require("formatter.filetypes.cs").csharpier,
        },

        python = {
          require("formatter.filetypes.python").ruff,
        },
      },
    })

    vim.keymap.set(
      "n",
      "<leader>f",
      ":Format <CR>",
      { desc = "[F]ormat Current File", silent = true }
    )
  end,
}
