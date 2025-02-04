local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local group = augroup("LorenzoAutocmdGroup", {})

return {
  autocmd = autocmd,
  group = group,
}
