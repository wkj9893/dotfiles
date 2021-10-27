-- https://github.com/hrsh7th/nvim-cmp
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) 
    end
  },
  cmp.setup {
    mapping = {
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end
    }
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
  })
}


