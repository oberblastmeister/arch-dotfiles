local api = vim.api
local function setup()
  api.nvim_exec([[
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
omap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>Commentary<Plug>Commentary

noremap gc <Nop>
  ]], false)
end

return {setup = setup}
