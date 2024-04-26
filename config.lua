-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- {{{ General Vim Options

--vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
--vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines

-- }}}

-- {{{ Fold Settings

-- folding powered by treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter#folding
-- look for foldenable: https://github.com/neovim/neovim/blob/master/src/nvim/options.lua
-- Vim cheatsheet, look for folds keys: https://devhints.io/vim

vim.opt.foldmethod = "marker"                   -- default is "normal"
vim.opt.foldmarker = "{{{,}}}"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = true                       -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
--vim.opt.foldlevel = 99
--vim.opt.foldlevelstart = 1

-- }}}

-- {{{ General LVim Options

lvim.format_on_save = true -- Disable this line
--lvim.colorscheme = "tokyonight-night"
lvim.colorscheme = "catppuccin"
lvim.transparent_window = true

-- }}}

lvim.plugins = {
    -- {{{ Color Schemes

    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        --'folke/tokyonight.nvim',
        'morhetz/gruvbox',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        init = function()
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            --vim.cmd.colorscheme 'tokyonight-:night'
            vim.cmd.colorscheme 'gruvbox'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },

    -- }}}

    { 'ThePrimeagen/vim-be-good' }
}

-- {{{ Custom LSP Command: OrganizeImports

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("tsserver", {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        }
    },
})

lvim.keys.normal_mode["<leader>lo"] = "<cmd>OrganizeImports<CR>"

-- }}}
