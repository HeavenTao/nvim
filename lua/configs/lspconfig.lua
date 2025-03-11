-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local utils = require "../utils"

-- EXAMPLE
local servers = { "html", "cssls", "jsonls", "clangd", "nixd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local os_name = utils.get_os_name()
local vue_language_server_path = ""
if os_name == "nixos" then
  local user = os.getenv "USER"
  vue_language_server_path = "/etc/profiles/per-user/" .. user .. "/bin/vue-language-server"
else
  local mason_registry = require "mason-registry"
  vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"
end

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  settings = {
    javascript = {
      format = {
        indentSize = 2,
        tabSize = 2,
        convertTabsToSpaces = true,
        semicolons = "insert",
      },
    },
    typescript = {
      format = {
        indentSize = 2,
        tabSize = 2,
        convertTabsToSpaces = true,
        semicolons = "insert",
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.zig", "*.zon" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

lspconfig.zls.setup {
  cmd = { "/etc/profiles/per-user/ht/bin/zls" },
  settings = {
    zls = {
      semantic_tokens = "partial",
      zig_exe_path = "/etc/profiles/per-user/ht/bin/zig",
    },
  },
}
