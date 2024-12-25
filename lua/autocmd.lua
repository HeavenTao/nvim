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
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true, desc = "Quit buffer" })
  end,
})

--vim.cmd("autocmd BufNewFile,BufRead * set fileformat=unix")

--clipboard on wsl
if vim.fn.has "wsl" == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg '"')
    end,
  })
end
