return {
  "LunarVim/breadcrumbs.nvim",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "SmiteshP/nvim-navic",
      opts = {
        lsp = { auto_attach = true },
      },
    },
  },
}
