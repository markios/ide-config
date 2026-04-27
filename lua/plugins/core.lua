return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
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
