return {
  "mhartington/formatter.nvim",
  config = function()
    -- local util = require("formatter.util")

    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },

        javascript = {
          require("formatter.filetypes.javascript").prettierd,
        },

        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettierd,
        },

        typescript = {
          require("formatter.filetypes.typescript").prettierd,
        },

        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettierd,
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
          require("formatter.filetypes.markdown").prettierd,
        },

        html = {
          require("formatter.filetypes.html").prettierd,
        },

        css = {
          require("formatter.filetypes.css").prettierd,
        },

        yaml = {
          require("formatter.filetypes.yaml").prettierd,
        },

        go = {
          require("formatter.filetypes.go").gofumpt,
        }
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
