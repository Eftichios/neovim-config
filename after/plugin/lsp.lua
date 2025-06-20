require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "pylsp",
        "bashls"
    }
}

local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.setup_servers({ 'dartls', force = true })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                -- linting
                ruff = {
                    enabled = true,         -- Enable the plugin
                    formatEnabled = true,   -- Enables formatting using ruffs formatter
                    extendSelect = { "I" }, -- Rules that are additionally used by ruff
                    format = { "I" },       -- Rules that are marked fixable by ruff that should be fixed when running textDocument/formatting
                    lineLength = 100        -- Max line length
                },

                -- disable other formatters
                black = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },

                -- disable other linters
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },

                -- type checking
                pylsp_mypy = { enabled = true },
                mypy = { enabled = true },

                -- auto-completion options
                jedi_completion = { fuzzy = true },

                -- import sorting
                pyls_isort = { enabled = true }
            }
        }
    }
}

lsp.setup()
