vim.diagnostic.config({
    virtual_text = {
        prefix = '■',
        spacing = 4,
        source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
    },
})

-- enable inlay hints
vim.lsp.inlay_hint.enable(true)
