local status, saga = pcall(require, 'lspsaga')
if not status then
    return
end
saga.setup({
    ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {
            ["Folder"] = { "📂", "@comment" },
            ["Text"] = { "🔤", "String" },
            ["Method"] = { "🧰", "Function" },
            ["Function"] = { "🛠️", "Function" },
            ["Constructor"] = { "🏗️", "@constructor" },
            ["Field"] = { "🏷️", "@field" },
            ["Variable"] = { "📊", "@variable" },
            ["Class"] = { "📚", "Include" },
            ["Interface"] = { "🖥️", "Type" },
            ["Module"] = { "📦", "Exception" },
            ["Property"] = { "🏷️", "@property" },
            --["Unit"] = { "📏", "" },
            --["Value"] = { "🔢", "" },
            ["Enum"] = { "🆔", "@number" },
            --["Keyword"] = { "🔑", "" },
            --["Snippet"] = { "🧩", "" },
            --["Color"] = { "🎨", "" },
            ["File"] = { "📄", "Tag" },
            --["Reference"] = { "🗃️", "" },
            ["EnumMember"] = { "🆔", "Number" },
            ["Constant"] = { "📌", "Constant" },
            ["Struct"] = { "🧱", "Type" },
            ["Event"] = { "✨", "Constant" },
            ["Operator"] = { "➗", "Operator" },
            ["TypeParameter"] = { " ", "Type" },


            ['Namespace'] = { '🗃️', 'Include' },
            ['Package'] = { '📦', 'Label' },
            ['String'] = { '🔤', 'String' },
            ['Number'] = { '🔢', 'Number' },
            ['Boolean'] = { '❓', 'Boolean' },
            ['Array'] = { '⛓️ ', 'Type' },
            ['Object'] = { '📚', 'Type' },
            ['Null'] = { '🟩', 'Constant' },

        },
    },
    outline = {
        keys = {
            jump = "<CR>",
            expand_collapse = "h",
            quit = "q",
        },
    },
    finder = {
        --percentage
        max_height = 0.7,
        keys = {
            jump_to = 'p',
            edit = { 'o', '<CR>' },
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>'
        },
    },
})
