return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- Use config to guarantee this executes explicitly
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Must be lowercase! (latte, frappe, macchiato, mocha)
			})

			-- Force Neovim to redraw the scheme right away
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				filetype = {
					typescript = "bun run",
					typescriptreact = "bun run",
				},
			})
		end,
	},
}
