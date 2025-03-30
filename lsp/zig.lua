local user = os.getenv "USER"
return {
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
