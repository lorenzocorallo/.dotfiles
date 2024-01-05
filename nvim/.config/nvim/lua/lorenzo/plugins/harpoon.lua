return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    ---@diagnostic disable-next-line: missing-parameter
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Harpoon: [A]dd To List" })

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Show List" })

    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon: Select 1st" })

    vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon: Select 2nd" })

    vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon: Select 3rd" })

    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon: Select 4th" })
  end,
}
