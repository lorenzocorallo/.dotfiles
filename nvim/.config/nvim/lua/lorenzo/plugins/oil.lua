return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    CustomOilBar = function()
      local path = vim.fn.expand("%")
      path = path:gsub("oil://", "")

      return "  " .. vim.fn.fnamemodify(path, ":.")
    end

    require("oil").setup({
      columns = {
        "icon",
      },
      skip_confirm_for_simple_edits = true,
      confirmation = {
        border = "rounded",
      },
      win_options = {
        winbar = "%{v:lua.CustomOilBar()}",
      },
      view_options = {
        show_hidden = true,
      },
      keymaps_help = {
        border = "rounded",
      },
      keymaps = {
        ["<C-s>"] = false,
        ["<C-h>"] = false,
        ["<C-t>"] = false,
        ["<C-p>"] = false,
        ["<C-l>"] = false,
        ["<C-r>"] = "actions.refresh",
        ["`"] = false,
        ["~"] = false,
      },
    })

    vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "[V]iew [P]roject (oil)" })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" })
  end,
}
