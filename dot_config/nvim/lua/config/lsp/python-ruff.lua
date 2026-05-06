-- global lsp capabilities from config.lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.hover = nil
capabilities.textDocument.definition = nil
capabilities.textDocument.references = nil
capabilities.textDocument.documentSymbol = nil
capabilities.textDocument.workspaceSymbol = nil
capabilities.textDocument.rename = nil
capabilities.textDocument.signatureHelp = nil

vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "ruff.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },

    capabilities = capabilities,

    settings = {
        lint = { enable = true },
        format = { enable = false },
        organizeImports = false,
    },
})

vim.lsp.enable("ruff")
