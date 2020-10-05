local M = {}
local loop = vim.loop
local api = vim.api

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
