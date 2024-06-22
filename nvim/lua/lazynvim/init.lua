local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Startup
    "goolord/alpha-nvim",

    -- Indent
    "lukas-reineke/indent-blankline.nvim",

    -- Surround
    "tpope/vim-surround",

    -- Css color
    "NvChad/nvim-colorizer.lua",

    -- Find & Replace in workspace
    "nvim-pack/nvim-spectre",

    -- Theme
    "olimorris/onedarkpro.nvim",
    "xiyaowong/nvim-transparent",

    -- Highlight same text
    "RRethy/vim-illuminate",

    -- Rainbow brackets
    "HiPhish/rainbow-delimiters.nvim",

    -- Tree sistter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- Icons
    "DaikyXendo/nvim-material-icon",

    -- File browser
    -- { "nvim-tree/nvim-tree.lua", commit = "c3c6544ee00333b0f1d6a13735d0dd302dba4f70" },
    "nvim-tree/nvim-tree.lua",

    -- View file
    "edluffy/hologram.nvim",

    -- File search
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

    -- Status bar
    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",

    -- LSP
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
    "nvimdev/lspsaga.nvim",
    "ray-x/lsp_signature.nvim",

    -- Autocomplete
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",

    -- UI support
    "MunifTanjim/nui.nvim",

    -- AI
    "Exafunction/codeium.vim",
    "jackMort/ChatGPT.nvim",

    -- Snippet
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- LSP installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",

    -- Trouble
    -- "folke/trouble.nvim",

    -- Rust
    "Saecki/crates.nvim",
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        lazy = false,
    },

    -- Close tag
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    -- Formatter
    "stevearc/conform.nvim",

    -- Comment
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",

    -- Quick select
    "phaazon/hop.nvim",

    -- Tailwind
    "roobert/tailwindcss-colorizer-cmp.nvim",

    -- Undo tree
    "mbbill/undotree",

    -- Git
    "tanvirtin/vgit.nvim",
    { "lewis6991/gitsigns.nvim", commit = "031abb065452248c30ce8d8fb4d4eb9eeb69d1f0" },

    -- Scroll bar
    "petertriho/nvim-scrollbar",
    "kevinhwang91/nvim-hlslens",

    -- Debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
})
