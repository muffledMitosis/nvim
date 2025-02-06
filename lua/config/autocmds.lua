local function write_server_name()
  local nvim_server_file = (vim.fn.has("win32") == 1 and os.getenv("TEMP") or "/tmp") .. "/vimtexserver.txt"
  vim.fn.writefile({vim.v.servername}, nvim_server_file)
end

vim.api.nvim_create_augroup("vimtex_common", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = write_server_name,
  group = "vimtex_common",
})
