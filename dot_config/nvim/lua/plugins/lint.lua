return {
    "mfussenegger/nvim-lint",
    opts = {
        linters_by_ft = {
            python = {
                "ruff",
            },
            c = { "clang-tidy" },
            cpp = { "clang-tidy" },
        },
        linters = {
            ruff = {
                cmd = "ruff",
                args = { "check", "--stdin=filename", "$FILENAME", "-" },
                stdin = true,
            },
            ["clang-tidy"] = {
                cmd = "clang-tidy",
                args = { "--quiet", "--warnings-as-errors=*", "--" },
                stdin = true,
                stdin_filename = function()
                    return vim.api.nvim_buf_get_name(0)
                end,
            },
        },
    },

    config = function(_, opts)
        vim.tbl_deep_extend("force", require("lint").linters_by_ft, opts.linters_by_ft)
        vim.tbl_deep_extend("force", require("lint").linters, opts.linters)

        -- lint on save
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
