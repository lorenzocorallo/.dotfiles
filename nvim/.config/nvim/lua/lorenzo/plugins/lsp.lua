return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "fatih/vim-go",
  },
  priority = 100,
  config = function()
    require("mason").setup()

    local ensure_installed = {
      "ts_ls",
      "eslint",
      "lua_ls",
      "rust_analyzer",
      "ruff_lsp",
      "pyright",
      "gopls",
    }

    -- if client.name == "omnisharp" then
    --   client.server_capabilities.semanticTokensProvider = nil
    -- end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
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

    -- vim.go config --
    vim.g.go_addtags_transform = "camelcase"
    vim.g.go_fmt_autosave = 0
    vim.g.go_mod_fmt_autosave = 0
    vim.g.go_imports_autosave = 0
    vim.g.go_doc_keywordprg_enabled = 0 -- fuck nnoremap K -> :GoDoc (i want my hover remap)

    vim.g.go_doc_popup_window = 1
    vim.g.go_term_enabled = 1
    vim.g.go_term_mode = "split"
    -- END --

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      handlers = handlers,
    })

    -- REMAP --
    local autocmd = require("lorenzo.autocmd").autocmd
    local group = require("lorenzo.autocmd").group
    autocmd("LspAttach", {
      group = group,
      callback = function(e)
        vim.diagnostic.config({
          update_in_insert = true,
          float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
          virtual_text = true,
        })

        local keymap = function(keys, func, desc, mode, category)
          if desc then
            desc = (category or "LSP") .. ": " .. desc
          end

          vim.keymap.set(mode or "n", keys, func, { buffer = e.buf, desc = desc })
        end

        keymap("K", vim.lsp.buf.hover, "Hover")
        keymap("<leader>\\", ":LspRestart<CR>", "Restart the LSP")
        keymap("<leader>c", vim.lsp.buf.code_action, "[C]ode Action")
        keymap("<leader>vd", vim.diagnostic.open_float, "[V]iew [D]iagnostics")
        keymap("<leader>vws", vim.lsp.buf.workspace_symbol, "[V]iew [W]orkspace [S]ymbols")
        keymap("<leader>vrr", vim.lsp.buf.references, "[V]iew [R]eferences")
        keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        keymap("<C-h>", vim.lsp.buf.signature_help, "Signature [H]elp", "i")

        -- telescope remaps --
        keymap(
          "<leader>vds",
          require("telescope.builtin").lsp_document_symbols,
          "[V]iew [D]ocument [S]ymbols"
        )
        keymap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        keymap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        -- end

        local termCmdAutofocus = function(cmd)
          return function()
            vim.cmd(cmd)
            vim.cmd("wincmd p")
            vim.cmd("startinsert")
          end
        end

        if vim.bo.filetype == "go" then
          -- Golang remaps --
          keymap("<leader>Gta", ":GoAddTags<CR>", "[T]ags [A]dd", "n", "GOLANG")
          keymap("<leader>Gtr", ":GoRemoveTags<CR>", "[T]ags [R]emove", "n", "GOLANG")
          keymap("<leader>GR", termCmdAutofocus(":GoRun<CR>"), "[R]un", "n", "GOLANG")
          keymap("<leader>GB", ":GoBuild<CR>", "[B]uild", "n", "GOLANG")
          keymap("<leader>GTa", ":GoTest<CR>", "[T]est [A]ll", "n", "GOLANG")
          keymap(
            "<leader>GTf",
            termCmdAutofocus(":GoTestFunc<CR>"),
            "[T]est Single [F]unction",
            "n",
            "GOLANG"
          )
          keymap("<leader>Gmt", function()
            local output = vim.fn.system("go mod tidy")
            print(output)
            vim.cmd("LspRestart")
          end, "[M]od [T]idy", "n", "GOLANG")
        end
      end,
    })
    -- END --

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local luasnip = require("luasnip")
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- use enter to confirm
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
    })
  end,
}
