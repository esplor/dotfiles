return {
  "flashcodes-themayankjha/fkthemes.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    {
      "sainnhe/gruvbox-material",
      lazy = false,
      priority = 1000,
      config = function()
        if vim.env.TERM == "linux" then
          vim.cmd.colorscheme("habamax")
        else
          vim.g.gruvbox_material_transparent_background = 2
          vim.cmd.colorscheme("gruvbox-material")
        end
      end,
    },
    { "catppuccin/nvim", name = "catppuccin" },
    "folke/tokyonight.nvim",
    "rose-pine/neovim",
  },
  config = function()
    require("fkthemes").setup({
      default_theme = "gruvbox-material",
      themes = {
        "gruvbox-material",
        "tokyonight",
        "tokyonight-night",
        "tokyonight-moon",
        "catppuccin",
        "catppuccin-mocha",
        "catppuccin-macchiato",
        "rose-pine",
      },
      keymaps = { enable = false },
    })
    vim.keymap.set("n", "<leader>ts", "<cmd>FkThemePicker<CR>", { desc = "[T]heme [S]witch" })
  end,
}
