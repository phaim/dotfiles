local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local M = {}

M.config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        }, 

        mapping = {
            --['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            --['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        sources = cmp.config.sources({
            {name = "nvim_lsp"},
            {name = "luasnip"},
            {name = "path"},
            {name = "buffer", keyword_length = 4},
            --{name = "fuzzy_buffer", keyword_length = 4},
        }),

        --formatting = {
        --    format = require('lspkind').cmp_format({with_text = true, maxwidth = 50})
        --},

        experimental = {
            native_menu = false,
            ghost_text = true,
        },
    })

    cmp.setup.cmdline('/', {
        sources = {
            {name = "nvim_lsp_document_symbol" },
            {name = 'buffer'}
        }
    })

    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            {name = 'path'},
        }, {
            {name = 'cmdline', keyword_length = 4}
        })
    })
end


return M
