-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local utils = require "../utils"

-- EXAMPLE
local servers = { "html", "cssls", "jsonls", "clangd", "zls", "nixd" }
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

if os_name == "nixos" then
else
  local mason_registry = require "mason-registry"
  local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"

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
  lspconfig.volar.setup {}
end
