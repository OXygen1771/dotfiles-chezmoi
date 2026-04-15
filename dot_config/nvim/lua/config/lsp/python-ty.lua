vim.lsp.config("ty", {
    cmd = { "uv", "run", "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    settings = {
        ty = {},
    },
})

vim.lsp.enable("ty")
