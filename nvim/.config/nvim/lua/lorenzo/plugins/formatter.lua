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

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		vim.keymap.set("n", "<leader>f", ":Format <CR>", { desc = "[F]ormat Current File", silent = true })
	end,
}
