local function augroup(name)
  return vim.api.nvim_create_augroup("nv_chard_custorm" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "qf",
    "help",
    "checkhealth",
  },
  callback=function (event)
    vim.bo[event.buf].buflisted=false
    vim.keymap.set("n","q","<cmd>close<cr>",{buffer=event.buf,silent=true,desc="Quit buffer"})
  end
})
