return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = {
                -- fix all auto-fixable errors
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
            },
            c = { "clang-format" },
            cpp = { "clang-format" },
            lua = { "stylua" },
        },
        formatters = {
            ["clang-format"] = {
                command = "clang-format",
                args = { "--style=file", "--assume-filename", "$FILENAME" },
                stdin = true,
            },
        },
        format_on_save = {
            timeout_ms = 250,
            lsp_fallback = true,
        },
    },
}
