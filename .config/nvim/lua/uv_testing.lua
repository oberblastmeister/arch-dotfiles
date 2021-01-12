local uv = vim.loop
local M = {}

function M.work_test() 
  local ctx = uv.new_work(function(n) --work,in threadpool
		vim.api.nvim_out_write("hello")
    -- local t = uv.thread_self()
    -- uv.sleep(100)
    return n*n,n
  end, function(r,n)
    -- print(string.format('%d => %d', n, r))
    print(n, r)
  end)    --after work, in loop thread

  uv.queue_work(ctx,2)
  uv.queue_work(ctx,4)
  uv.queue_work(ctx,6)
  uv.queue_work(ctx,8)
  uv.queue_work(ctx,10)
end

M.work_test()

local function entryFunction()
	local uv = require'luv'
	local pipe = uv.new_pipe(false)
	local another_pipe = uv.new_pipe(false)
	pipe:connect("/tmp/socket.async.tmp")
	another_pipe:connect("/tmp/socket.aync.another")
	pipe:read_start(function(err, chunk)
		if err then
			another_pipe:write("error")
		else
			another_pipe:write(chunk)
		end
	end)
end

function M.asyncLoad()
	local pipe = uv.new_pipe(false)
	local another_pipe = uv.new_pipe(false)
	pipe:bind("/tmp/socket.async.tmp")
	pipe:listen(128, function()
		local client = uv.new_pipe(false)
		pipe:accept(client)
		for i = 1, 3 do
			local data = string.format("Here %d", i)
			client:write(data)
			-- os.execute("sleep 1")
		end
	end)
	another_pipe:bind("/tmp/socket.aync.another")
	another_pipe:listen(128, function()
		local client = uv.new_pipe(false)
		another_pipe:accept(client)
		client:read_start(function(err, chunk)
			if err then
				print(err)
			else
				print(chunk)
			end
		end)
	end)
	M.thread = uv.new_thread(entryFunction)
end

return M
