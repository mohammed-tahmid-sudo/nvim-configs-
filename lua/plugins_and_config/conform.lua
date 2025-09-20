return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      python = { "black" },
      cpp    = { "clang-format" },
      c      = { "clang-format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html       = { "prettier" },
      css        = { "prettier" },
      lua        = { "stylua" },
    },
  },
  keys = {
    { "<leader>F", function() require("conform").format({ async = false }) end, desc = "Format buffer" }
  }
}

