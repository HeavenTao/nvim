return {
  name = "ags run this dir",
  builder = function()
    return {
      cmd = { "ags", "run", "." },
    }
  end,
}
