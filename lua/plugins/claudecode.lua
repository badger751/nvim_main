return {
  {
    "coder/claudecode.nvim",

    lazy = false,
    priority = 1000,

    dependencies = {
      "folke/snacks.nvim",
    },

    opts = {
      terminal_cmd = vim.fn.expand("$HOME") .. "/.local/bin/claude",
      auto_start = true,
    },

    config = function(_, opts)
      require("claudecode").setup(opts)
    end,
  },
}
