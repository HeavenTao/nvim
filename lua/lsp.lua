dofile(vim.g.base46_cache .. "lsp")
vim.lsp.enable {
  "zig",
  "html",
  "css",
  "json",
  "clangd",
  "nix",
  "lua",
  "ts",
}
