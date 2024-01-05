return {
  {
    "nvim-lua/plenary.nvim",
    priority = 500,
  },
  {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
      vim.g.vimtex_view_general_viewer = "zathura"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({})
    end,
  },

  "lukas-reineke/indent-blankline.nvim",
  { "lewis6991/gitsigns.nvim", opts = {} },
  "theprimeagen/vim-be-good",
  "lambdalisue/suda.vim",
}
