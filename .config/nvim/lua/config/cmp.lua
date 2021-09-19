local function setup()
  local cmp = require'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    -- mapping = {
    --   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- },
    -- sources = {
    --   { name = '...' },
    --   ...
    -- }
  }
end

return {setup = setup}

