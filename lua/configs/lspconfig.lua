-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

vim.lsp.inlay_hint.enable()

vim.lsp.enable "cssls"
vim.lsp.enable "html"
vim.lsp.enable "clangd"
vim.lsp.enable "jsonls"
vim.lsp.enable "yamlls"

vim.lsp.config["bashls"] = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
}
vim.lsp.enable "bashls"

vim.lsp.config["ts_ls"] = {
  filetypes = { "vue", "javascript" },
}

vim.lsp.enable "ts_ls"

vim.lsp.enable "nil_ls"

--zig
local user = os.getenv "USER"
vim.lsp.config["zig"] = {
  cmd = { "/etc/profiles/per-user/" .. user .. "/bin/zls" },
  root_markers = { "build.zig.zon", "build.zig" },
  filetypes = { "zig", "zon" },
  settings = {
    zls = {
      semantic_tokens = "partial",
      zig_exe_path = "/etc/profiles/per-user/" .. user .. "/bin/zig",
    },
  },
}
vim.lsp.enable "zig"
