local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- <cmd> set rnu! <CR>

-- enbale relative line number
autocmd("BufEnter", {
  pattern = "*",
  command = "set relativenumber",
})
