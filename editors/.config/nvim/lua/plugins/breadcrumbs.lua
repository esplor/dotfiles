return {
  "LunarVim/breadcrumbs.nvim",
  enabled = vim.env.TERM ~= "linux",
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
