return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    -- Set up Mason DAP
    require("mason-nvim-dap").setup({
      ensure_installed = { "python" },
      automatic_setup = true,
    })

    -- Set up Python debugger
    local dap_python = require("dap-python")
    dap_python.setup("uv")

	table.insert(require('dap').configurations.python, {
	  type = 'python',
	  request = 'launch',
	  name = 'python - file',
	  program = '${file}',
	})
	table.insert(require('dap').configurations.python, {
	  type = 'python',
	  request = 'launch',
	  name = 'python cwd',
	  program = '${file}',
	  cwd = "${workspaceFolder}"
	})

    -- Set up UI
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

	-- get visual selection
	local function get_visual_selection()
	  local bufnr = vim.api.nvim_get_current_buf()
	  local start_pos = vim.fn.getpos("'<")
	  local end_pos = vim.fn.getpos("'>")

	  local start_row = start_pos[2] - 1
	  local start_col = start_pos[3] - 1
	  local end_row = end_pos[2] - 1
	  local end_col = end_pos[3]

	  local lines = vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {})
	  return table.concat(lines, "\n")
	end
	

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }


    map("n", "<Leader>r", dap.continue, opts)
    map("n", "<Leader>c", dap.step_over, opts)
    map("n", "<Leader>i", dap.step_into, opts)
    map("n", "<Leader>o", dap.step_out, opts)
    map("n", "<Leader>t", dap.toggle_breakpoint, opts)
    map("n", "<Leader>q", dap.terminate, opts)
	map("v", "<S-CR>", function()
	  local text = get_visual_selection()
	  dap.repl.execute(text)
	end, { noremap = true, silent = true, desc = "Execute visual selection in DAP REPL" })	
	
  end,
}

