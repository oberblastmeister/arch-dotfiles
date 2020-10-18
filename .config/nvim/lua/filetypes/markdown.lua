local M = {}
local loop = vim.loop
local api = vim.api

function M.setup()
  vim.g.vim_markdown_no_default_key_mappings = 1
  vim.g.vim_markdown_conceal = 0
  vim.g.vim_markdown_conceal_code_blocks = 0
  vim.g.vim_markdown_auto_insert_bullets = 1
  vim.g.vim_markdown_math = 1
  vim.g.vim_markdown_strikethrough = 1
end

function M.convert_file()
  local shortname = vim.fn.expand('%:t:r')
  local fullname = api.nvim_buf_get_name(0)
  local newname = shortname .. '.pdf'
  handle, pid = vim.loop.spawn('pandoc', {
    args = {fullname, '-o', newname}
  },
  function()
    print('Document Conversion Complete')
    handle:close()
    if handle2 == nil then
      handle2, pid2 = vim.loop.spawn('zathura', {
        args = {newname}
      },
      function()
        print('closing')
        handle2:close()
      end)
    end
  end)
end

return M
