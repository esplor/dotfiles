return {
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
}
