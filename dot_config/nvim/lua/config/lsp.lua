-- shorthand
local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- universal options for buffer-local mappings
        local opts = { buffer = ev.buf }

        -- keybinds
        opts.desc = "Show information about the symbol under the cursor"
        keymap.set('n', '<C-q>', vim.lsp.buf.hover, opts)

        opts.desc = "Go to symbol definition"
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        opts.desc = "Go to symbol declaration"
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        opts.desc = "Go to symbol references"
        keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        opts.desc = "Rename all symbol references"
        keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        opts.desc = "Display symbol signature"
        keymap.set({ 'n', 'v' }, '<leader>q', vim.lsp.buf.signature_help, opts)

        opts.desc = "Perform a code action"
        keymap.set({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action, opts)
    end,
})


-- load lsp configurations in lua/config/lsp/
local function load_lsp_configs()
    local lua_dir = vim.fn.stdpath("config") .. "/lua"
    local config_lsp_dir = lua_dir .. "/config/lsp"

    -- if lsp config dir exists
    if vim.loop.fs_stat(config_lsp_dir) then
        local function scan(dir, rel_path)
            local files = vim.fn.glob(dir .. "/*", false, true)
            for _, f in ipairs(files) do
                local stat = vim.loop.fs_stat(f)
                -- scan recursively into subdirectories, if needed
                if stat and stat.type == "directory" then
                    scan(f, rel_path .. "/" .. vim.fn.fnamemodify(f, ":t"))
                elseif stat and stat.type == "file" and f:match("%.lua$") then
                    local module_name = f:sub(#lua_dir + 2, -5):gsub("/", ".")
                    -- call require("lsp.lua")
                    pcall(require, module_name)
                end
            end
        end
        scan(config_lsp_dir, "")
    end
end

load_lsp_configs()
