require('regexplainer').setup({
    mode = 'narrative', -- TODO: 'ascii', 'graphical'

    -- automatically show the explainer when the cursor enters a regexp
    auto = true,
    filetypes = {
        'py',
    },
    debug = true,
    mappings = {
        toggle = 'gR',
        -- examples, not defaults:
        -- show = 'gS',
        -- hide = 'gH',
        -- show_split = 'gP',
        -- show_popup = 'gU',
    },
})
