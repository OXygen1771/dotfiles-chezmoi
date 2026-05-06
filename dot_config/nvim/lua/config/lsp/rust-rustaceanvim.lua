local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.rustaceanvim = {
    server = {
        capabilities = capabilities,

        default_settings = {
            ["rust-analyzer"] = {
                completion = {
                    autoimport = { enable = true },
                },
                checkOnSave = true,
            },
        },
    },
}
