local lsp = vim.lsp
local window = require('lsp_settings/window')

local function setup()
  -- lsp.handlers['textDocument/hover'] = function(_, method, result)
  --   lsp.util.focusable_float(method, function()
  --     if not (result and result.contents) then return end
  --     local markdown_lines = lsp.util.convert_input_to_markdown_lines(result.contents)
  --     markdown_lines = lsp.util.trim_empty_lines(markdown_lines)
  --     if vim.tbl_isempty(markdown_lines) then return end

  --     local opts = { max_width = 80 }

  --     local bufnr, contents_winid, _, border_winid = window.fancy_floating_markdown(markdown_lines, opts)
  --     lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, contents_winid)
  --     lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, border_winid)
  --     return bufnr,contents_winid
  --   end)
  -- end

  -- workaround for rust-analyzers
  -- lsp.handlers["textDocument/rename"] = function(_, _, result)
  --   if not result then return end
  --   if result.documentChanges then
  --     local merged_changes = {}
  --     local versions = {}
  --     for _, change in ipairs(result.documentChanges) do
  --       if change.kind then
  --         error("not supported")
  --       else
  --         local edits = merged_changes[change.textDocument.uri] or {}
  --         versions[change.textDocument.uri] = change.textDocument.version

  --         for _, edit in ipairs(change.edits) do table.insert(edits, edit) end

  --         merged_changes[change.textDocument.uri] = edits
  --       end
  --     end
  --     local new_changes = {}
  --     for uri, edits in pairs(merged_changes) do
  --       table.insert(new_changes, {
  --         edits = edits,
  --         textDocument = {
  --           uri = uri,
  --           version = versions[uri],
  --         }
  --       })
  --     end
  --     result.documentChanges = new_changes
  --   end

  --   vim.lsp.util.apply_workspace_edit(result)
  -- end
end

return {setup = setup}
