-- Define a custom command `:Newfile` that prompts the user for a filename
vim.api.nvim_create_user_command('Newfile', function()
    -- Prompt the user for a filename
    local input = vim.fn.input("Enter filename: ")

    -- Check if a filename was provided
    if input == nil or input == "" then
        print("No filename provided.")
        return
    end

    -- Create or open the specified file
    vim.cmd("edit " .. vim.fn.fnameescape(input))
end, {})
