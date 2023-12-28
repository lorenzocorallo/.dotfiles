-- This file can be loaded by calling `lua require("plugins")` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    -- or                            , branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" }
  }
  use({
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-treesitter/nvim-treesitter-context" },
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }
  use "lukas-reineke/indent-blankline.nvim"
  use("nvim-treesitter/playground")
  use {
    "windwp/nvim-ts-autotag",
    requires = { "nvim-treesitter" }
  }
  use {
    "lewis6991/gitsigns.nvim",
    -- tag = "release" -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  })
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Formatting
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  }
  use("terrortylor/nvim-comment")

  -- use "maxmellon/vim-jsx-pretty" --jsx support
  -- use "pangloss/vim-javascript" --js support
  -- use "leafgarland/typescript-vim" --ts support
  -- use "peitalin/vim-jsx-typescript" --tsx support

  use {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_general_viewer = "zathura"
    end,
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use "theprimeagen/vim-be-good"
  use "lambdalisue/suda.vim"
end)
