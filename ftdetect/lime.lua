vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.lime",
    callback = function()
        -- Set filetype to lime
        vim.bo.filetype = "lime"
        -- Load and setup lime syntax
        require('lime').setup()
    end
})
