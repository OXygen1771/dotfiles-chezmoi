vim.lsp.config("ty", {
    cmd = { "uv", "run", "ty", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", ".git", "ty.toml", "setup.py", "setup.cfg", "requirements.txt" },
    settings = {
        ty = {},
    },
})

vim.lsp.enable("ty")
