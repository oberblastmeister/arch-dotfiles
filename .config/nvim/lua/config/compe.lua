local compe = require('compe')

local function setup()

  compe.setup {
    enabled = true,
    debug = false,
    preselect = 'always',
    -- throttle_time = 40,
    -- source_timeout = ... number ...;
    -- incomplete_delay = 10,
    -- allow_prefix_unmatch = false,

    source = {
      path = true,
      buffer = true,
      vsnip = true,
      nvim_lsp = true,
      nvim_lua = true,
      -- this is slow for now
      -- treesitter = true,
    },
  }

  vim.cmd [[imap <silent><expr> <Tab> compe#confirm('<Tab>')]]

  vim.cmd [[imap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[smap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
  vim.cmd [[smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
  -- vim.cmd [[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]]

  vim.cmd [[set completeopt=menu,menuone,noselect]]
end

return {setup = setup}
