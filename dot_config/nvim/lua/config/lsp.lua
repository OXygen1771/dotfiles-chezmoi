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
