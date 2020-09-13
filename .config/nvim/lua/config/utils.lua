-- takes a table of global variable names to toggle
local function toggle_global_variables(global_variables)
  for _, g_var_name in ipairs(global_variables) do
    if vim.g[g_var_name] == 0 then
      vim.g[g_var_name] = 1
    elseif vim.g[g_var_name] == 1 then
      vim.g[g_var_name] = 0
    else
      print('error, must be 0 or 1')
    end
  end
end

local function toggle_settings(settings)
  for _, setting_name in ipairs(settings) do
    if vim.o[setting_name] == true then
      vim.o[setting_name] = false
    elseif vim.o[setting_name] == false then
      vim.o[setting_name] = true
    else
      print('error must be boolean')
    end
  end
end

return {
  toggle_global_variable = toggle_global_variable
}
