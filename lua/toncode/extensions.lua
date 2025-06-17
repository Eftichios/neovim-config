vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.h",
    callback = function()
        local filename = vim.fn.expand("%:t:r"):upper() -- Get the file name without extension and make it uppercase
        local lines = {
            "#ifndef " .. filename .. "_H",
            "#define " .. filename .. "_H",
            "",
            "",
            "#endif // " .. filename .. "_H",
        }
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end,
})

local function insert_comment_block()
    local input = vim.fn.input("Enter comment text: ")
    local lines = {
        "// ========================================",
        "//            " .. input,
        "// ========================================"
    }
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))         -- Get current cursor row
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines) -- Insert lines above the cursor
end


vim.keymap.set("n", "<leader>v", function() insert_comment_block() end)
