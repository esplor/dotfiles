return {
  "coder/claudecode.nvim",
  -- snacks.nvim is required for the terminal and diff UI
  dependencies = { "folke/snacks.nvim" },
  lazy = false,
  opts = {
    -- Full path to the claude binary.
    -- Required because Neovim may not inherit ~/.local/bin in its $PATH.
    terminal_cmd = "claude",
    terminal = {
      -- Which side the terminal panel opens on: "left" or "right"
      split_side = "right",
      -- How wide the terminal panel is as a fraction of the screen (0.30 = 30%)
      split_width_percentage = 0.4,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude Code" },
    { "<leader>as", "<cmd>ClaudeCodeSend<CR>", desc = "Send selection to Claude", mode = "v" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude Code terminal" },
  },
}
