vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "ruff.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },

    -- restrain ruff to work nicely with ty
    capabilities = {
        -- textDocumentSync = false,
        -- completionProvider = false,
        hoverProvider = false,
        definitionProvider = false,
        referencesProvider = false,
        documentSymbolProvider = false,
        workspaceSymbolProvider = false,
        renameProvider = false,
        signatureHelpProvider = false,

        codeActionProvider = true,
        executeCommandProvider = { commands = { "ruff.applyAutofix", "ruff.applyOrganizeImports", "ruff.applyFormat" } },
    },

    settings = {
        lint = { enable = true },
        format = { enable = false },
        organizeImports = false,
    },
})

vim.lsp.enable("ruff")
