return {
  "amitds1997/remote-nvim.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    ssh_config = {
      ssh_config_file_paths = { vim.fn.expand("~/.ssh/config") },
    },
    -- Open remote session in a new tab instead of a float popup so terminal
    -- transparency is preserved
    client_callback = function(port, _)
      vim.schedule(function()
        vim.cmd("tabnew")
        vim.fn.termopen(("nvim --server localhost:%s --remote-ui"):format(port), {
          on_exit = function(_, exit_code)
            if exit_code ~= 0 then
              vim.notify(
                ("Remote client exited with code %s"):format(exit_code),
                vim.log.levels.ERROR
              )
            end
          end,
        })
        vim.cmd.startinsert()
      end)
    end,
  },
}
