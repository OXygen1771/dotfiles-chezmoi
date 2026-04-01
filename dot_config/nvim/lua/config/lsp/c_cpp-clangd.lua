vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", },
    root_markers = { "CMakeLists.txt", ".git", ".clang-tidy", ".clang-format" },
})

vim.lsp.enable("clangd")
