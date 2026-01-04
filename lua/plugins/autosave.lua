return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      write_all_buffers = true,
      trigger_events = {"InsertLeave", "TextChanged"},
      debounce_delay = 135,
    })
  end,
}

