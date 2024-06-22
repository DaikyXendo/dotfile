local scrollbar_setup, scrollbar = pcall(require, "scrollbar")
if not scrollbar_setup then
    return
end

-- import hlslens safely
local hlslens_setup, hlslens = pcall(require, "hlslens")
if not hlslens_setup then
    return
end

scrollbar.setup({
    marks = {
        Search = { color = "#FFA500" },
        Error = { color = "#FF0000" },
        Warn = { color = "#FFFF00" },
        Info = { color = "#00FF00" },
        Hint = { color = "#0000FF" },
        Misc = { color = "#6A0DAD" },
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "NvimTree",
        "alpha",
        "dashboard",
        "lspinfo",
        "layzy",
    },
})

hlslens.setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = "always",
    build_position_cb = function(plist)
        require("scrollbar.handlers.search").handler.show(plist.start_pos)
    end,
})

vim.cmd([[
   augroup scrollbar_search_hide
       autocmd!
       autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
   augroup END
]])
