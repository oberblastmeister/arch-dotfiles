local compe = require('compe')

local function setup()

  compe.setup {
    enabled = true,
    debug = false,
    preselect = 'confirm',

    source = {
      path = true,
      buffer = true,
      -- vsnip = true,
      nvim_lsp = true,
      -- nvim_lua = true,
      -- this is slow for now
      -- treesitter = true,
    },
  }

  vim.cmd [[imap <silent><expr> <Tab> compe#confirm({ 'select': v:true, 'keys': '<Tab>' })]]

  vim.cmd [[imap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[smap <expr> <c-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
  vim.cmd [[imap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]
  vim.cmd [[smap <expr> <c-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<c-k>']]

  vim.cmd [[set completeopt=menuone,noinsert,noselect]]
end

return {setup = setup}
