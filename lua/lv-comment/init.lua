require('nvim_comment').setup({
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = false,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "gc",
    -- Visual/Operator mapping left hand side
    operator_mapping = "gc"
})

vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gc', ':CommentToggle<CR>"', {noremap = true, silent = true})
