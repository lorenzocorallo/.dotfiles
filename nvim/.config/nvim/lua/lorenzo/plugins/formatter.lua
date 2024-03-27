return {
  "mhartington/formatter.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "cs",
    "lua",
    "json",
    "markdown",
    "python",
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

        json = {
          require("formatter.filetypes.json").jq,
        },

        markdown = {
          require("formatter.filetypes.markdown").prettier,
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
