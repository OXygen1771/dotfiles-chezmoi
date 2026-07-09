vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp" },
    root_markers = { ".git", ".clang-tidy", ".clang-format", "CMakeLists.txt" },
})

vim.lsp.enable("clangd")
