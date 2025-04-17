return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		-- Bubbles config for lualine
		-- Author: lokesh-krishna
		-- MIT license, see LICENSE for more details.

		-- stylua: ignore
		require('lualine').setup {
			options = {
				theme = 'iceberg_dark',
				component_separators = '',
				section_separators = { left = ''},
			},
			sections = {
				lualine_a = { { 'mode', right_padding = 4 } },
				lualine_b = { 'filename', 'branch' },
				lualine_c = {
					'%=', --[[ add your center compoentnts here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { 'filetype', 'progress' },
				lualine_z = {
					{ 'location', left_padding = 2,right_padding = 4 },
				},
			},
			inactive_sections = {
				lualine_a = { 'filename' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'location' },
			},
			tabline = {},
			extensions = {},
		}
	end
}
