local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name --
local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------
--                     General                       --
-------------------------------------------------------

-- Some time type :W instead of :w
vim.api.nvim_create_user_command('W', function()
    vim.api.nvim_command("w")
end, {})

vim.api.nvim_create_user_command('Git',
    function(opts)
        if opts.fargs[1] == "diff" then
            vim.api.nvim_command("VGit buffer_diff_preview")
        elseif opts.fargs[1] == "his" then
            vim.api.nvim_command("VGit buffer_history_preview")
        elseif opts.fargs[1] == "pdiff" then
            vim.api.nvim_command("VGit project_diff_preview")
        end
    end,
    { nargs = 1 })


-- Ctrl + C = Esc
keymap("i", "<C-c>", "<Esc><Esc>", opts)

-- Center line
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)

-- Resize pane --
keymap("n", "<M-Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -1<CR>", opts)
-- keymap("n", "<M-Down>", ":resize +1<CR>", opts)
-- keymap("n", "<M-Up>", ":resize -1<CR>", opts)

-- Split pane
keymap("n", "<C-Right>", "<C-w>v", opts)

-- Switch pane
keymap("n", "<S-Right>", "<C-w>l", opts)
keymap("n", "<S-Left>", "<C-w>h", opts)

-- Delete without cutting --
keymap("n", "d", '"_d', opts)
keymap("x", "d", '"_d', opts)

-- Change without cutting
keymap("n", "c", '"_c', opts)

-- Delete inside word --
keymap("n", "dw", '"_ciw', opts)

-- Copy inside word
keymap("n", "yw", "yiw", opts)

-- Change buffer  --
keymap("n", "<Space>h", ":bp<CR>", opts)
keymap("n", "<Space>l", ":bn<CR>", opts)

-- Close buffer --
keymap("n", "Q", ":bd<CR>", opts)

-- Move cursor left
keymap("i", "<C-z>", "<Esc>la", opts)

-- Move block or line up, down --
keymap("n", "<M-j>", ":m .+1<CR>==", opts)
keymap("n", "<M-k>", ":m .-2<CR>==", opts)
keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", term_opts)
keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", term_opts)
keymap("x", "<M-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Duplicate block up, down --
keymap("v", "<M-q>", ":t'><CR>gv", opts)
keymap("v", "<M-m>", ":t-1<CR>gv", opts)

-- Alt+o to no hightlight --
keymap("", "<M-o>", ":noh<CR>", opts)

-- Visual Block
keymap("n", "<M-v>", "<C-v>", opts)

-------------------------------------------------------
--                     Plugins                       --
-------------------------------------------------------

-- Nvim-tree --
keymap("n", "<Space>e", ":NvimTreeToggle<CR>", opts)

-- Spectre --
keymap("n", "<Space>f", "<cmd>lua require('spectre').open()<CR>", opts)

-- Hop --
keymap("", "s", "<cmd>HopWord<CR>", term_opts)
keymap("", "L", "<cmd>HopLine<CR>", term_opts)
keymap("", "S", "<cmd>HopPattern<CR>", term_opts)

-- Telescope --
keymap("n", ";;", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", ";r", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", ";b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", ";t", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", ";e", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap("n", ";h", "<cmd>lua require('telescope.builtin').resume()<CR>", opts)

-- Lspsaga --
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", term_opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", term_opts)

-- Only jump to error
vim.keymap.set("n", "[E",
    function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end
    , term_opts)

vim.keymap.set("n", "]E",
    function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end
    , term_opts)

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<Space>cn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<Space>a", "<cmd>Lspsaga code_action<CR>", opts)

-- Luasnip --
-- keymap("i", "<Tab>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', opts)

-- Trouble
keymap("n", "<Space>p", "<cmd>TroubleToggle<CR>", opts)

-- Codeium --
vim.g.codeium_disable_bindings = 1
vim.keymap.set("i", "<S-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
vim.keymap.set("i", "<A-n>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
vim.keymap.set("i", "<A-p>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
vim.keymap.set("i", "<A-.>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
