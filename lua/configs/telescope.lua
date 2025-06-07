return {
  defaults = {
    mappings = {
      i = {
        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
      },
      n = {
        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
      },
    },
    preview = {
      hide_on_startup = true,
    },
    file_ignore_patterns = { "^obj/", "^bin/" },
  },
}
