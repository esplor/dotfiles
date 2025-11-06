return {
  "norcalli/nvim-colorizer.lua",
  event = "BufEnter",
  opts = {},
  config = function()
    require("colorizer").setup()
    vim.keymap.set("n", "<leader>ct", ":ColorizerToggle<CR>", { desc = "[C]olorizer [T]oggle" })
  end,
}
