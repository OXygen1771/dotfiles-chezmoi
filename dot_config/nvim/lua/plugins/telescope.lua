return {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = {
        -- required
        "nvim-lua/plenary.nvim",

        -- optional, built either with make + gcc/clang/mingw or cmake + msvc
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"
        },
    },

    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-[>", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end
}
