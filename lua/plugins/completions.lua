return {
  {
    "github/copilot.vim",
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {
        model = "gpt-4.1", -- AI model to use
        temperature = 0.1, -- Lower = focused, higher = creative
        window = {
          layout = "vertical", -- 'vertical', 'horizontal', 'float'
          width = 0.5, -- 50% of screen width
        },
        auto_insert_mode = true, -- Enter insert mode when opening
      },
    },
    -- {
    --   "ibhagwan/fzf-lua",
    --   -- optional for icon support
    --   dependencies = { "nvim-tree/nvim-web-devicons" },
    --   -- or if using mini.icons/mini.nvim
    --   -- dependencies = { "nvim-mini/mini.icons" },
    --   ---@module "fzf-lua"
    --   ---@type fzf-lua.Config|{}
    --   ---@diagnostic disable: missing-fields
    --   opts = {},
    --   ---@diagnostic enable: missing-fields
    -- },
  },
}
