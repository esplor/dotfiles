return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = 0
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
