local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    html = { "prettier" },
    cshtml = { "prettier" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    c = { "clang-format" },
    nix = { "alejandra" },
    vue = { "prettierd", "prettier", stop_after_first = true },
    -- cs = { "dotnet-csharpier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
