return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    opts = function()
        -- register nvim-cmp lsp capabilities
        vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })

        local cmp = require("cmp")

        return {
            auto_brackets = {},
            completion = {
                autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
            },
            mapping = cmp.mapping.preset.insert({
                -- call autocomplete menu
                ["<C-Space>"] = cmp.mapping.complete(),
                -- select next
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- select previous
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- apply selected
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- exit menu
                ["<Esc>"] = cmp.mapping.abort(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
            experimental = {
                ghost_text = true,
            },
        }
    end,
}
