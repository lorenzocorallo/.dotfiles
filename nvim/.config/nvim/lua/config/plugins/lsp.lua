return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { "j-hui/fidget.nvim", opts = {} },
    {
      "fatih/vim-go",
      ft = "go",
    }
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = true,
    })


    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["gopls"] = function()
        require("lspconfig").gopls.setup({
          settings = {
            gopls = {
              gofumpt = true,
            },
          },
        })
      end,
    }

    local group = require("config.autocmd").group
    local autocmd = require("config.autocmd").autocmd
    autocmd("LspAttach", {
      group = group,
      pattern = "*",
      callback = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>\\", ":LspRestart<CR>", { desc = "Restart the LSP" })
        -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Restart the LSP" })
        vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, { desc = "[C]ode Action" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "[V]iew [D]iagnostics" })
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "[V]iew [W]orkspace [S]ymbols" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature [H]elp" })
      end
    })
  end,
}
