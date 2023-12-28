local lsp_zero = require("lsp-zero")

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  lsp_zero.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>c", function() vim.lsp_zero.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp_zero.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)

  vim.diagnostic.config({
    virtual_text = true,
  })

  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()

local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- use enter to confirm
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})


local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    -- Replace these with the tools you have installed
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.csharpier,
    null_ls.builtins.formatting.xmlformat,
  },
})

require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
})

