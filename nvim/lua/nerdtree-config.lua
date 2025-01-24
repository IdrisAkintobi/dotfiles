-- NERDTree configuration
vim.g.NERDTreeQuitOnOpen = 0 -- Automatically close NERDTree after opening a file.
vim.g.NERDTreeTabsOpenOnConsoleStartup = 1 -- Automatically opens NERDTree on console startup.
vim.g.NERDTreeShowLineNumbers = 0 -- Toggles line numbers in the NERDTree window.
vim.g.NERDTreeFileLines = 0
vim.g.NERDTreeOpenFilesInNewTab = 1 -- Opens files in a new tab by default.
vim.g.NERDTreeOpenFilesInNewSplit = 0 -- Opens files in a new horizontal split by default.
vim.g.NERDTreeAutoDeleteBuffer = 1 -- Automatically deletes the buffer when NERDTree is the last window.
vim.g.NERDTreeWinSize = 31 -- Sets the initial width of the NERDTree window.
vim.g.NERDTreeMinimalUI = 1 -- Simplifies the UI by hiding extra information like help text.
vim.g.NERDTreeDirArrows = 0 -- Toggles the display of directory arrows in the UI.
vim.g.NERDTreeShowHidden = 1 -- Toggles the display of hidden files (e.g., files starting with a .).
vim.g.NERDTreeIgnore = {'\\.pyc$', '\\~$', '\\.git$'} -- Specifies file patterns to ignore when displaying files and folders.
vim.g.NERDTreeMapOpenInTab = '<C-t>' -- Key mapping to open a file in a new tab.
vim.g.NERDTreeMapActivateNode = '<CR>' -- Key mapping for activating a node (open/close folder or file).
vim.g.NERDTreeMapOpenSplit = 's' -- Key mapping to open a file in a horizontal split.
vim.g.NERDTreeMapOpenVSplit = 'i' -- Key mapping to open a file in a vertical split.
vim.g.NERDTreeBookmarksFile = '~/.vim/nerdtree-bookmarks' -- File path to store NERDTree bookmarks.
vim.g.NERDTreeMouseMode = 3 -- Enables mouse support for NERDTree. Default: 2 (partially enabled).

-- Start NERDTree automatically when nvim starts.
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("NERDTree") -- Start NERDTree
        vim.cmd("wincmd p") -- Move the cursor back to the previous window
    end
})
--  If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local current_win = vim.fn.winnr()
        local nerdtree_last = vim.fn.bufname("#"):match("NERD_tree_%d+")
        local current_buf = vim.fn.bufname("%"):match("NERD_tree_%d+")
        local total_windows = vim.fn.winnr("$")

        if current_win == vim.fn.winnr("h") and nerdtree_last and not current_buf and total_windows > 1 then
            local buf = vim.fn.bufnr()
            vim.cmd("buffer#")
            vim.cmd("normal! <C-W>w")
            vim.cmd("buffer " .. buf)
        end
    end
})
-- NERDTree keymaps
vim.keymap.set("n", "<C-n>", ":NERDTreeMirror<CR>:NERDTreeFocus<CR>", {
    noremap = true,
    silent = true
})
-- Find the current file in NERDTree
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", {
    noremap = true,
    silent = true
})
