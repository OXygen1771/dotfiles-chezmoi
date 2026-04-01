return {
    {
        "mason-org/mason.nvim",
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- for configs
                "lua_ls",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {}, },
            "neovim/nvim-lspconfig",
        },
    }
}
