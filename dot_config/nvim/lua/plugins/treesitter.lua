return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                max_lines = 4,
                multiline_threshold = 2,
            },
        },
    },

    lazy = false,
    branch = "main",  -- use the new treesitter
    build = ":TSUpdate",

    -- we have to do this after the major treesitter updaate
    config = function()
        local ts = require("nvim-treesitter")

        -- install languages
        local languages = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "fish",
            "gitcommit",
            "gitignore",
            "go",
            "gotmpl",
            "helm",
            "lua",
            "powershell",
            "python",
            "rust",
            "toml",
            "yaml"
        }

        -- add go template file extensions
        vim.filetype.add({
            extension = {
                gotmpl = "gotmpl",
                tmpl = "gotmpl",
            },
            pattern = {
                -- standard helm templates
                [".*/templates/.*%tpl"] = "helm",
                [".*/templates/.*%tmpl"] = "helm",
                -- chemzmoi templates
                [".*%.sh%.tmpl"] = "bash",
                [".*%.ps1%.tmpl"] = "ps1",
                [".*%.fish%.tmpl"] = "fish",
                [".*%.toml%.tmpl"] = "toml",
                -- other languages
                [".*%.lua%.tmpl"] = "lua",
            }
        })
        vim.treesitter.language.register("gotmpl", "gotmpl")

        -- treesitter init
        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",

            ensure_installed = languages,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            -- todo: maybe add folding?
        })

        -- install parsers after lazy.nvim finishes loading all plugins
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyDone",
            callback = function()
                -- install languages that are not installed
                for _, lang in ipairs(languages) do
                    vim.schedule(function()
                        pcall(function() vim.cmd("TSInstall " .. lang) end)
                    end)
                end
            end,
        })
    end
}
