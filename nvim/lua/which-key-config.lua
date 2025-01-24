local status, wk = pcall(require, "which-key")
if not status then
    return
end

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    defaults = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
        win = {
            border = "rounded", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
            padding = {2, 2, 2, 2}, -- extra window padding [top, right, bottom, left]
            winblend = 0 -- transparency level
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>" -- binding to scroll up inside the popup
        },
        layout = {
            height = {
                min = 4,
                max = 25
            }, -- min and max height of the columns
            width = {
                min = 20,
                max = 50
            }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left" -- align columns left, center, or right
        },
        filter = nil -- function to filter mappings (e.g., to hide specific mappings)
    },
    triggers = {"<leader>"} -- specify a list of prefixes manually
}

wk.add({{
    "<leader>f",
    ['group'] = "file"
}, -- group
{
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    ['desc'] = "Find File",
    ['mode'] = "n"
}, {
    "<leader>ft",
    "<cmd>Telescope live_grep<cr>",
    ['desc'] = "Find Text Pattern",
    ['mode'] = "n"
}, {
    "<leader>fc",
    "<cmd>Telescope colorscheme<cr>",
    ['desc'] = "Change Telescope Colorscheme",
    ['mode'] = "n"
}, {
    "<leader>fb",
    function()
        print("hello")
    end,
    ['desc'] = "Foobar",
    ['hidden'] = true -- hide this keymap
}, {
    "<leader>fn",
    "<cmd>Telescope oldfiles<cr>",
    ['desc'] = "New File"
}, {
    "<leader>fr",
    ['desc'] = "Recent Files"
}, {
    "<leader>e",
    "<cmd>NERDTreeToggle<cr>",
    ['desc'] = "Explorer",
    ['silent'] = true
}, {
    "<leader>w",
    ['proxy'] = "<c-w>",
    ['group'] = "windows"
}, -- proxy to window mappings
{
    "<leader>b",
    ['group'] = "buffers",
    ['expand'] = function()
        return require("which-key.extras").expand.buf()
    end
}, {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = {"n", "v"}, -- NORMAL and VISUAL mode
    {
        "<leader>r",
        "<cmd>lua vim.lsp.buf.format{async=true}<cr>",
        ['desc'] = "Reformat Code",
        ['silent'] = true
    },
    {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        ['desc'] = "LSP Info"
    },
    {
        "<leader>ls",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        ['desc'] = "LSP Info"
    },
    {
        "<leader>lm",
        "<cmd>Mason<cr>",
        ['desc'] = "Mason (LSP Manager)"
    },
    {
        "<leader>q",
        "<cmd>q<cr>",
        ['desc'] = "Quit"
    }, -- no need to specify mode since it's inherited
    {
        "<leader>sq",
        "<cmd>wqall!<cr>",
        ['desc'] = "Save All and Quit"
    },
    {
        "<leader>k",
        "<cmd>bdelete<cr>",
        ['desc'] = "Kill Buffer"
    },
    {
        "<leader>w",
        "<cmd>w!<cr>",
        ['desc'] = "Save File"
    },
    {
        "<leader>p",
        "<cmd>PlugStatus<cr>",
        ['desc'] = "Plugin Manager"
    },
    {
        "<leader>t",
        "<cmd>ToggleTerm<cr>",
        ['desc'] = "Toggle Terminal"
    },
    {
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<cr>",
        ['desc'] = "Floating Terminal"
    },
    {
        "<leader>th",
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        ['desc'] = "Horizontal Terminal"
    },
    {
        "<leader>tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        ['desc'] = "Horizontal Terminal"
    },
    {
        "<leader>tn",
        "<cmd>lua _NODE_TOGGLE()<cr>",
        ['desc'] = "Node Terminal"
    },
    {
        "<leader>tp",
        "<cmd>lua _PYTHON_TOGGLE()<cr>",
        ['desc'] = "Python Terminal"
    },
    {
        "<leader>g",
        ['group'] = "Git",
        ['desc'] = "Git Commands"
    },
    {
        "<leader>gj",
        "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
        ['desc'] = "Next Hunk"
    },
    {
        "<leader>gk",
        "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
        ['desc'] = "Prev Hunk"
    },
    {
        "<leader>gl",
        "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        ['desc'] = "Blame"
    },
    {
        "<leader>gp",
        "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
        ['desc'] = "Preview Hunk"
    },
    {
        "<leader>gr",
        "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
        ['desc'] = "Reset Hunk"
    },
    {
        "<leader>gR",
        "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
        ['desc'] = "Reset Buffer"
    },
    {
        "<leader>gs",
        "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
        ['desc'] = "Stage Hunk"
    },
    {
        "<leader>gu",
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        ['desc'] = "Undo Stage Hunk"
    },
    {
        "<leader>go",
        "<cmd>Telescope git_status<cr>",
        ['desc'] = "Open changed file"
    },
    {
        "<leader>gb",
        "<cmd>Telescope git_branches<cr>",
        ['desc'] = "Checkout branch"
    },
    {
        "<leader>gc",
        "<cmd>Telescope git_commits<cr>",
        ['desc'] = "Checkout commit"
    },
    {
        "<leader>gd",
        "<cmd>Gitsigns diffthis HEAD<cr>",
        ['desc'] = "Diff"
    }
}})
-- vim.g.which_key_debug = true
-- vim.g.which_key_show_on_startup = false
