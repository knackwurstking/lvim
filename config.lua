-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.format_on_save = true -- Disable this line

--vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
--vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4        -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4           -- insert 2 spaces for a tab
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = true           -- wrap lines

lvim.colorscheme = "gruvbox"
lvim.plugins = {
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
            --vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.colorscheme 'gruvbox'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    { 'ThePrimeagen/vim-be-good' }
}
