local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
    return
end

-- Define highlight groups for the beginning and end of scopes
local highlight = {"RainbowRed", "RainbowCyan"}

local hooks = require "ibl.hooks"
-- Create the highlight groups
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", {
        fg = "#E06C75" -- Red
    })
    vim.api.nvim_set_hl(0, "RainbowCyan", {
        fg = "#56B6C2" -- Cyan
    })
end)

-- Configure ibl
ibl.setup {
    -- Enable indentation guides
    indent = {
        char = "▏", -- Character used for indentation guides
        highlight = highlight -- Use the same highlight groups for indentation
    },
    -- Enable scope highlighting
    scope = {
        highlight = highlight, -- Use the same highlight groups for scope
        show_start = true, -- Show the beginning of the scope
        show_end = true -- Show the end of the scope
    }
}

-- Register the scope highlight hook
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
