vim.api.nvim_command('highlight NoteWord ctermfg=Green guifg=#00FF00')
vim.api.nvim_command('highlight ActionWord ctermfg=Yellow guifg=#FFFF00')

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        vim.fn.matchadd('ActionWord', '@TODO')
        vim.fn.matchadd('ActionWord', '@CLEANUP')
        vim.fn.matchadd('ActionWord', '@SPEED')
        vim.fn.matchadd('ActionWord', '@IMPORTANT')
        vim.fn.matchadd('NoteWord', '@NOTE')
    end
})
