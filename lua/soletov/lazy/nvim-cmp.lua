return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local cmp = require("cmp")

		cmp.setup({
			completion = {
				autocomplete = false,
			},
			sources = {
				{ name = "nvim_lsp" },
			},
		})
	end,
}
