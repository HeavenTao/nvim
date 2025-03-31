local vue_language_server_path = ""
local user = os.getenv "USER"
vue_language_server_path = "/etc/profiles/per-user/" .. user .. "/bin/vue-language-server"

return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
  single_file_support = true,
  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue", "javascript", "typescript" },
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
}
