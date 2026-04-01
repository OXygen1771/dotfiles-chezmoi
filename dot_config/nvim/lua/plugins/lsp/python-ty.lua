return {
    -- quite frankly, this shouldn't be necessary when using mason, but
    -- lazy.nvim wants this to be a correct plugin spec
    "neovim/nvim-lspconfig",

    config = function()
        vim.lsp.config("ty", {
            cmd = { "uv", "run", "ty", "server" },
            filetypes = { "python" },
            root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
            settings = {
                ty = {

                },
            },
        })

        vim.lsp.enable("ty")
    end,
}
