require("telescope").setup {

    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
}

require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf',  function() builtin.find_files({ path_display = { "truncate" } }) end)
vim.keymap.set('n', '<leader>paf', function() builtin.find_files({ hidden = true, path_display = { "truncate" } }) end)


vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pg', function()
    builtin.live_grep();
end)
