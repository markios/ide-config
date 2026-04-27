return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            ["w"] = "open_with_window_picker",
          },
        },
        buffers = { follow_current_file = { enabled = true } },
        filesystem = {
          follow_current_file = { enabled = true },
        },
      })
    end,
  },
}
