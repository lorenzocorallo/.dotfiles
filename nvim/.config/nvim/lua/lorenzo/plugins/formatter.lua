return {
  "stevearc/conform.nvim",
  config = function()
    local js = {
      "biome-check",
      prettier = {
        require_cwd = true,
      },
    }
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = js,
        javascriptreact = js,
        typescript = js,
        typescriptreact = js,
        json = js,
        css = js,
        html = js,
        python = { "ruff_format" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        go = { "goimports", "gofumpt" },
      },
      format_on_save = {
        timeout_ms = 300,
        lsp_fallback = true,
      },
    })
    require("conform").formatters["biome-check"] = {
      append_args = { "--unsafe" },
    }

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "[F]ormat current file/buffer", silent = true })
  end,
}
