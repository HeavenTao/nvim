return {
  name = "Zig Run",
  builder = function()
    return {
      cmd = { "zig" },
      args = { "build", "run" },
      components = {
        {
          "on_output_quickfix",
          open = true,
        },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "zig" },
  },
}
