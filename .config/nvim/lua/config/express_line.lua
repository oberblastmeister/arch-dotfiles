local el = require('el')
local extensions = require('el.extensions')
local subscribe = require('el.subscribe')
local builtin = require('el.builtin')
local helper = require('el.helper')
local sections = require('el.sections')
local modes = require('el.data').modes
local mode_highlights = require('el.data').mode_highlights

local function get_mode(_, buffer)
  local mode = vim.api.nvim_get_mode().mode

  -- remove completion mode
  local without_completion = string.match(mode, "(.+)c")
  if without_completion ~= nil then
    mode = without_completion
  end

  local higroup = mode_highlights[mode]
  local display_name = modes[mode][2]

  if buffer.bufnr ~= vim.api.nvim_get_current_buf() then
    higroup = higroup .. "Inactive"
  end

  return sections.highlight(higroup, string.format(' %s \u{E0B1}', display_name))
end

local function git_branch()
  if vim.fn.exists('*FugitiveHead') == 1 then
    local branch = vim.fn.FugitiveHead()
    if branch ~= nil and branch ~= '' then
      return '' .. branch
    end
  end
  return ''
end

local function lsp_status()
  local count = 0
  for _ in pairs(vim.lsp.buf_get_clients()) do count = count + 1 end
  if count > 0 then
    return require('lsp-status').status()
  end
  return ''
end

local function read_only()
  if vim.o.readonly == 0 then 
    return '' 
  end
  return ''
end
-- ℓ
-- ℓ
-- 𝑓
-- ƒ
-- ᶜ

local function setup()
  local generator = function()
    local el_segments = {}

    local function separator(n, sep)
      local sep
      if sep == nil then
        sep =  string.rep(' ', n)
      else
        sep = string.rep(sep, n)
      end
      table.insert(el_segments, sep)
    end

    table.insert(el_segments, get_mode)
    separator(2)

    table.insert(el_segments, builtin.file)
    separator(1)

    table.insert(el_segments,
    subscribe.buf_autocmd(
    "el_file_icon",
    "BufRead",
    function(_, buffer)
      return extensions.file_icon(_, buffer)
    end
    ))
    separator(2)

    table.insert(el_segments, helper.async_buf_setter(
      win_id,
      'el_git_branch',
      git_branch,
      2000
    ))

    separator(1)

    -- async
    table.insert(el_segments, helper.async_buf_setter(
      win_id,
      'el_git_stat',
      extensions.git_changes,
      2000
    ))

    separator(30)

    table.insert(el_segments, lsp_status)

    separator(2)

    table.insert(el_segments, '\u{2113} %l \u{1d68c} %c')

    return el_segments
  end

  el.setup({generator = generator})
end

return {
  setup = setup
}
