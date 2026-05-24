return {
  {
    "ahmedkhalf/project.nvim",

    lazy = false,

    opts = {
      detection_methods = { "lsp", "pattern" },

      patterns = {
        ".git",
        "CMakeLists.txt",
        "package.json",
        "Cargo.toml",
        "Makefile",
        "pyproject.toml",
      },

      silent_chdir = true,
    },

    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
