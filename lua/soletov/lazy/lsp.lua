return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
	"hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local null_ls = require("null-ls")
	local cmp = require("cmp")
	
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "pylsp" },
    })

	lspconfig.pylsp.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})

    mason_lspconfig.setup_handlers({
      function(server)
        lspconfig[server].setup({
          on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          end,
        })
      end,
    })

	cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
    })
	
    -- Ruff + Black with none-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.ruff, -- linting
        null_ls.builtins.formatting.black, -- formatting
        null_ls.builtins.formatting.ruff,  -- auto-fix with ruff
      },
    })
  end,
}

