return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,

    opts = {
        -- close neotree if it is the last window in the current tab
        close_if_last_window = false,

        -- keep the cursor on the first letter of the filename when moving in the tree
        enable_cursor_hijack = true,

        -- don't hide root node
        hide_root_node = false,

        -- configure mappings here
        window = {
            -- open to the right
            position = "right",
        },

        -- configure fs behaviour here
        filesystem = {
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            -- use neo-tree instead of netrw
            hijack_netrw_behavior = "open_current",

            filtered_items = {
                -- display filtered items differently than normal items
                visible = true,
                
                -- file hiding
                hide_dotfiles = false,
                hide_gitignored = false,
                -- hide files ignored by other gitignore-like files
                hide_ignored = false,
                -- these other gitignore-like files
                ignore_files = {
                    ".neotreeignore",
                    ".ignore",
                    ".chezmoiignore"
                },

                -- hide Windows hidden files
                hide_hidden = false,
                hide_by_name = {
                    ".DS_Store",
                    "thumbs.db",
                },
                always_show = {
                    ".gitignore"
                }
            },
        },

        clipboard = {
            sync = "global"
        },
    },

    config = function(_, opts)
        require("neo-tree").setup(opts)

        vim.keymap.set("n", "<M-1>", ":Neotree toggle<CR>", { desc = "Toggle and focus Neotree" })
    end
}
