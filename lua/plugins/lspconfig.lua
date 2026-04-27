return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
}
