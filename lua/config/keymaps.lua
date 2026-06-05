-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
vim.api.nvim_set_keymap(
	"n",
	"<leader>cp",
	[[:let @+ = expand('%:p')<CR>]],
	{ noremap = true, silent = true, desc = "Copy file path" }
)
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", ":enew<CR>", { noremap = true, silent = true, desc = "New buffer" })

vim.keymap.set("n", "<leader>bm", "<cmd>Markview<CR>", { noremap = true, silent = true, desc = "Toggle Markview" })

-- Creates a command :ScratchTS that opens a temporary TypeScript file
vim.api.nvim_create_user_command("ScratchTS", function()
	local cwd = vim.fn.getcwd()

	-- Open scratch.ts in that specific directory
	vim.cmd("edit " .. cwd .. "/__scratch.ts")
end, { desc = "Open a TypeScript scratchpad" })

-- execute run code for the scratch
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
