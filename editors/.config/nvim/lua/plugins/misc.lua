-- Plugins with minimal configuration.

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX   = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      ERROR = { icon = " ", color = "error",   alt = { "ERR" } },
      TODO  = { icon = " ", color = "info" },
      HACK  = { icon = " ", color = "warning" },
      WARN  = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF  = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE  = { icon = " ", color = "hint",    alt = { "INFO" } },
      TEST  = { icon = " ", color = "test",    alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
}
