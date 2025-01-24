local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

local map = vim.keymap.set

bufferline.setup({
    options = {
        mode = "buffers", -- Set to "tabs" to show only tabpages
        numbers = "none", -- Options: "ordinal", "buffer_id", "both", or a function
        close_command = "bdelete! %d", -- Command to close a buffer
        right_mouse_command = "bdelete! %d", -- Right-click to close a buffer
        left_mouse_command = "buffer %d", -- Left-click to switch to a buffer
        middle_mouse_command = nil, -- Middle-click command (optional)
        indicator_icon = '▎', -- Indicator icon for the current buffer
        buffer_close_icon = '', -- Icon for closing a buffer
        modified_icon = '●', -- Icon for modified buffers
        close_icon = '', -- Icon for the close button
        left_trunc_marker = '', -- Left truncation marker
        right_trunc_marker = '', -- Right truncation marker
        name_formatter = function(buf) -- Custom buffer name formatter
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r') -- Shorten Markdown filenames
            end
            return buf.name
        end,
        max_name_length = 18, -- Maximum length of buffer names
        max_prefix_length = 15, -- Prefix length for deduplicated buffers
        tab_size = 18, -- Size of tabs
        diagnostics = "nvim_lsp", -- Enable diagnostics (options: false, "nvim_lsp", "coc")
        diagnostics_update_in_insert = false, -- Update diagnostics in insert mode
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")" -- Custom diagnostics indicator
        end,
        custom_filter = function(buf_number, buf_numbers) -- Custom buffer filter
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            return false
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left", -- Align text for offsets
            highlight = "Directory" -- Highlight group for the offset
        }},
        color_icons = true, -- Enable color icons for filetypes
        show_buffer_icons = true, -- Show icons for buffers
        show_buffer_close_icons = true, -- Show close icons for buffers
        show_close_icon = true, -- Show the close icon
        show_tab_indicators = true, -- Show tab indicators
        persist_buffer_sort = true, -- Persist buffer sorting
        separator_style = "slant", -- Separator style: "slant", "thick", "thin", or a table
        enforce_regular_tabs = true, -- Enforce regular tab sizes
        always_show_bufferline = true, -- Always show the bufferline
        sort_by = 'insert_after_current', -- Sort buffers: 'insert_after_current', 'insert_at_end', 'id', 'extension', etc.
        hover = {
            enabled = true, -- Enable hover highlights
            delay = 200, -- Hover delay in milliseconds
            reveal = {'close'} -- Reveal close button on hover
        },
        groups = {
            options = {
                toggle_hidden_on_enter = true -- Toggle hidden buffers on enter
            },
            items = {{
                name = "Tests", -- Group name
                auto_close = false, -- Auto-close group
                matcher = function(buf) -- Matcher function for the group
                    return buf.name:match('%_test%.lua') or buf.name:match('%_spec%.lua')
                end
            }}
        }
    }
})

-- Key mappings
map("n", "<S-b>", "<cmd> enew <CR>", {
    desc = "Create new buffer"
}) -- Create a new buffer
map("n", "<A-.>", "<cmd> BufferLineCycleNext <CR>", {
    desc = "Cycle next buffer"
}) -- Cycle to the next buffer
map("n", "<A-,>", "<cmd> BufferLineCyclePrev <CR>", {
    desc = "Cycle previous buffer"
}) -- Cycle to the previous buffer
map("n", "<A-s-.>", "<cmd> BufferLineMoveNext <CR>", {
    desc = "Move buffer to the right"
}) -- Move buffer to the right
map("n", "<A-s-,>", "<cmd> BufferLineMovePrev <CR>", {
    desc = "Move buffer to the left"
}) -- Move buffer to the left
map("n", "<A-f>", "<cmd> BufferLinePick <CR>", {
    desc = "Pick buffer"
}) -- Pick a buffer
map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>", {
    desc = "Close current buffer"
}) -- Close the current buffer

-- Map Alt+1 to Alt+9 to switch to the respective buffer
for i = 1, 9 do
    map("n", "<A-" .. i .. ">", "<cmd> BufferLineGoToBuffer " .. i .. "<CR>", {
        desc = "Go to buffer " .. i
    })
end
