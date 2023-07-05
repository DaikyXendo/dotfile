local status, colorscheme = pcall(require, 'onedarkpro')
if (not status) then
    return
end

colorscheme.setup({
    styles = {
        keywords = "italic",
        constants = "bold",
        comments = "italic",
    },
})
