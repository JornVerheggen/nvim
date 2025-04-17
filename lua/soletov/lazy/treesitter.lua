return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
		"elixir",
		"html",
		"javascript",
		"markdown",
		"markdown_inline",
		"lua",
		"python",
		"typescript",
		"vim",
		"vimdoc",
        "c",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
