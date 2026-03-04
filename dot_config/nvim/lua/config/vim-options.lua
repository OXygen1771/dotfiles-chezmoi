-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable wrap indenting
vim.opt.breakindent = true

-- End of buffer character
vim.opt.fillchars = { eob = " " }

-- Save undo history
vim.opt.undofile = true

-- Keep signcolum always
vim.opt.signcolumn = "yes"

-- Tabs & indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Number of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Confirm quitting without saving
vim.opt.confirm = true

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end
})
