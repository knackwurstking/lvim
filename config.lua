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
            --vim.cmd.colorscheme 'tokyonight-:night'
            vim.cmd.colorscheme 'gruvbox'

            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    { 'ThePrimeagen/vim-be-good' }
}

--lvim.autocommands._formatoptions = {}
--vim.opt.formatoptions = {
--    ["1"] = true,
--    ["2"] = true, -- Use indent from 2nd line of a paragraph
--    q = true,     -- Continue comments with gp"
--    c = false,    -- Auto warp comments using textwidth
--    r = true,     -- Continue comments when pressing Enter
--    n = true,     -- Recognize numbered lines
--    t = true,     -- Auto wrap lines using text width value
--    j = true,     -- Remove a comment leader when joining lines
--    -- Only break if the line was not longer than 'textwidth' when the insert
--    -- started and only at a white character that has been entered during the
--    -- current insert comment.
--    l = true,
--    v = true
--}

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
