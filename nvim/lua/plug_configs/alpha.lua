local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
end

dashboard.section.header.val = {
    [[                   ]],
    [[                       ]],
    [[                    ]],
    [[                         ]],
    [[                    ]],
}

dashboard.section.buttons.val = {
    button("f", "󰮗 " .. " Find file", ":Telescope find_files <CR>"),
    button("e", "󱏒 " .. " Explorer", ":ene <BAR> startinsert <CR><ESC>:NvimTreeToggle<CR>"),
    button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
    button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("u", " " .. " Update", ":PackerSync<CR>"),
    button("q", " " .. " Quit", ":qa<CR>"),
}

local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    return "github.com/DaikyXendo"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
