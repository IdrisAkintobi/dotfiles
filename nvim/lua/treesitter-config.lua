local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

ts.setup {
    ensure_installed = {"tsx", "toml", "json", "yaml", "css", "html", "lua", "go", "python", "solidity", "javascript"},
    sync_install = false,
    ignore_install = {""}, -- List of parsers to ignore installing
    highlight = {
        enable = true,
        disable = {}, -- List of languages that will be disabled
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true,
        disable = {} -- Disable indentation for YAML
    },
    autotag = {
        enable = true -- Enable autotag for supported languages
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, -- List of languages to disable rainbow brackets
        extended_mode = true, -- Highlight non-bracket delimiters like HTML tags
        max_file_lines = nil -- No limit on file lines
        -- colors = {}, -- Custom hex colors
        -- termcolors = {} -- Custom terminal colors
    }
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = {"javascript", "typescript.tsx"}
