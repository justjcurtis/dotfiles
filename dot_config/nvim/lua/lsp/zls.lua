return {
  enable_build_on_save = true,
  build_on_save = true,
  build_step = "check",

  zig_exe_path = "zig",
  warn_style = false,

  semantic_tokens = true,
  highlight_global_vars = true,

  inlay_hints = {
    enable = true,
  },
}
