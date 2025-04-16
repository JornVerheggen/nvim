-- vim settings
vim.cmd.colorscheme("nord")
vim.opt.clipboard = "unnamedplus" -- use system keyboard for yank
vim.opt.nu = true -- set line numbers -- set line numbers
vim.opt.relativenumber = true -- use relative line numbers
vim.opt.incsearch = true -- incremental search
vim.opt.signcolumn = "yes"
vim.o.termguicolors = true
vim.opt.shiftwidth = 4 -- Indent by 4 spaces when using '>'
vim.opt.tabstop = 4 -- A tab character is displayed as 4 spaces
vim.opt.softtabstop = 4 -- Number of spaces a tab counts while editing

-- keybindings
-- moving around
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h <esc>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j <esc>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k <esc>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l <esc>", { noremap = true, silent = true })

-- toggleterm
vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm <cr>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm <cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-r>", ":'<,'>ToggleTermSendVisualLines <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-r>", ":ToggleTermSendCurrentLine <CR>", { noremap = true, silent = true })

--files
vim.keymap.set("n", "<C-e>", "<cmd>:Neotree toggle <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<cmd>:Telescope fd <CR>", { noremap = true, silent = true })
