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

local status_line = {
  left = {
    get_mode,
    {
      builtin.file,
      subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buffer)
        return extensions.file_icon(_, buffer)
      end
      ),
    },

    helper.async_buf_setter(
    win_id,
    'el_git_branch',
    git_branch,
    2000
    ),

  },
  right = {
    lsp_status,
    '\u{2113} %l \u{1d68c} %c'
  },
}

local function separator(n, sep)
  local sep
  if sep == nil then
    sep =  string.rep(' ', n)
  else
    sep = string.rep(sep, n)
  end
  return sep
end

local function insert_module(status_line, module)
    if type(module) == "table" then
      for _, submodule in ipairs(module) do
        table.insert(res, submodule)
        table.insert(separator(1))
      end
      table.insert(separator(1))
    else
      table.insert(module)
      table.insert(separator(2))
    end
end

local function insert_multiple_modules(status_line, modules)
  for _, module in ipairs(modules) do
    insert_module(status_line, module)
  end
end

local function generator()
  local res
  insert_multiple_modules(status_line.left)
  local left = status_line.left
  return res
end

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

local function start()
  el.setup {
    generator = function(win_id)
      return {
        extensions.mode,

        separator(2),

        builtin.file,

        separator(1),

        -- subscribe.buf_autocmd(
        -- "el_file_icon",
        -- "BufRead",
        -- function(_, buffer)
        --   return extensions.file_icon(_, buffer)
        -- end
        -- ),
        -- sections.collapse_builtin {
        --   ' ',
        --   builtin.modified_flag
        -- },

        -- separator(2),
        -- helper.async_buf_setter(
        -- win_id,
        -- 'el_git_branch',
        -- git_branch,
        -- 2000
        -- ),

        -- separator(1),
        -- helper.async_buf_setter(
        --   win_id,
        --   'el_git_stat',
        --   extensions.git_changes,
        --   2000
        -- ),

        sections.split,

        -- sections.collapse_builtin {
        --   lsp_status,
        --   separator(2),
        --   '\u{2113} %l \u{1d68c} %c',
        --   separator(1),
        -- },
        lsp_status,

        '\u{2113} %l \u{1d68c} %c',
        separator(1),
        -- sections.collapse_builtin {
        --   '\u{2113} %l \u{1d68c} %c',
        --   separator(2),
        -- }
      }
    end
  }
end

local function tj()
  require('el').setup {
    generator = function(win_id)
      return {
        extensions.mode,
        sections.split,
        subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
          local icon = extensions.file_icon(_, bufnr)
          if icon then
            return icon .. ' '
          end

          return ''
        end),
        builtin.responsive_file(140, 90),
        sections.collapse_builtin {
          ' ',
          builtin.modified_flag
        },
        sections.split,
        -- lsp_statusline.current_function,
        -- lsp_statusline.server_progress,
        subscribe.buf_autocmd(
        "el_git_changes",
        "BufWritePost",
        function(window, buffer)
          return extensions.git_changes(window, buffer)
        end
        ),
        '[', builtin.line_with_width(3), ':',  builtin.column_with_width(2), ']',
        sections.collapse_builtin{
          '[',
          builtin.help_list,
          builtin.readonly_list,
          ']',
        },
        builtin.filetype,
      }
    end
  }
end

return {
  setup = setup,
  start = start,
  tj = tj,
}
