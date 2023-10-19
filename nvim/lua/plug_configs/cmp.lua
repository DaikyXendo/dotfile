local status, cmp = pcall(require, 'cmp')
if (not status) then
    return
end

require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require 'lspkind'

cmp.setup({
    -- Select first item
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    window = {
        completion = {
            -- winhighlight = "Normal:Pmenu,CursorLine:WildMenu,Search:None",
            winhighlight = "Normal:Pmenu,Search:None",
        }
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.scroll_docs(-4),
        ['<Down>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, {
            "i",
            "s",
        }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        -- { name = "cmp_tabnine" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            wirth_text = false,
            maxwidth = 80,
            before = require("tailwindcss-colorizer-cmp").formatter
        }),
    }
})
