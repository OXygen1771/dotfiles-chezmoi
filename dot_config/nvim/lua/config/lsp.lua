-- shorthand
local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- universal options for buffer-local mappings
        local opts = { buffer = ev.buf }

        -- keybinds
        opts.desc = "Show information about the symbol under the cursor"
        keymap.set("n", "<C-q>", vim.lsp.buf.hover, opts)

        opts.desc = "Go to symbol definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        opts.desc = "Go to symbol declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Go to symbol references"
        keymap.set("n", "gr", vim.lsp.buf.references, opts)
        opts.desc = "Rename all symbol references"
        keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        opts.desc = "Display symbol signature"
        keymap.set({ "n", "v" }, "<leader>q", vim.lsp.buf.signature_help, opts)

        opts.desc = "Perform a code action"
        keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, opts)
    end,
})

-- load lsp configurations in lua/config/lsp/
local function load_lsp_configs()
    local lua_dir = vim.fn.stdpath("config") .. "/lua"
    local config_lsp_dir = vim.fs.normalize(lua_dir .. "/config/lsp")

    -- if lsp config dir exists
    if vim.uv.fs_stat(config_lsp_dir) then
        for name, type in vim.fs.dir(config_lsp_dir, { recursive = true }) do
            -- scan recursively into subdirectories, if needed
            if type == "file" and name:match("%.lua$") then
                -- normalize name and strip extension
                local rel_path = "config/lsp/" .. name:sub(1, -5)
                -- convert config/lsp/lsp-name.lua to config.lsp.lsp-name
                local module_name = rel_path:gsub("/", ".")
                -- call require("lsp.lua")
                local ok, err = pcall(require, module_name)
                if not ok then
                    vim.notify("Error loading" .. module_name .. ": " .. err, vim.log.levels.ERROR)
                end
            end
        end
    end
end

-- add nvim-cmp capabilities to every server
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

load_lsp_configs()
