local status_ok, gs = pcall(require, "gitsigns")
if not status_ok then
    vim.notify("gitsigns not found!", vim.log.levels.WARN)
    return
end

gs.setup {
    -- Git signs configuration
    signs = {
        add = {
            text = "┃"
        }, -- Added lines
        change = {
            text = "┃"
        }, -- Changed lines
        delete = {
            text = "_"
        }, -- Deleted lines
        topdelete = {
            text = "‾"
        }, -- Top deleted lines
        changedelete = {
            text = "~"
        }, -- Changed and deleted lines
        untracked = {
            text = "┆"
        } -- Untracked files
    },

    -- Staged signs configuration
    signs_staged = {
        add = {
            text = "┃"
        }, -- Staged added lines
        change = {
            text = "┃"
        }, -- Staged changed lines
        delete = {
            text = "_"
        }, -- Staged deleted lines
        topdelete = {
            text = "‾"
        }, -- Staged top deleted lines
        changedelete = {
            text = "~"
        }, -- Staged changed and deleted lines
        untracked = {
            text = "┆"
        } -- Staged untracked files
    },
    signs_staged_enable = true, -- Enable staged signs

    -- Toggle options
    signcolumn = true, -- Show signs in the sign column
    numhl = false, -- Enable number line highlighting
    linehl = false, -- Enable line highlighting
    word_diff = false, -- Highlight word differences

    -- Git directory watcher
    watch_gitdir = {
        follow_files = true -- Follow file renames
    },

    -- Auto-attach to Git repositories
    auto_attach = true,

    -- Attach to untracked files
    attach_to_untracked = false,

    -- Current line blame
    current_line_blame = false, -- Disable by default
    current_line_blame_opts = {
        virt_text = true, -- Show blame as virtual text
        virt_text_pos = "eol", -- Position of virtual text ('eol', 'overlay', 'right_align')
        delay = 1000, -- Delay before showing blame
        ignore_whitespace = false, -- Include whitespace changes
        virt_text_priority = 100, -- Priority of virtual text
        use_focus = true -- Only show blame when the line is focused
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>", -- Blame format

    -- Sign priority
    sign_priority = 6, -- Priority of Git signs

    -- Debounce updates
    update_debounce = 100, -- Debounce time for updates (ms)

    -- Status formatter
    status_formatter = nil, -- Use default status formatter

    -- File length limit
    max_file_length = 40000, -- Files longer than this will not be processed

    -- Preview configuration
    preview_config = {
        border = "single", -- Border style for preview window
        style = "minimal", -- Window style
        relative = "cursor", -- Position relative to cursor
        row = 0, -- Vertical offset
        col = 1 -- Horizontal offset
    }
}
