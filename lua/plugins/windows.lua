return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  -- pick a window with snacks' built-in picker, then open the file there
                  ["w"] = { { "pick_win", "jump" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
