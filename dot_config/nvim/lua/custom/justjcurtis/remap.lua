-- remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>Q", ":q!<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>:Format<CR>:w<CR>")
vim.keymap.set("n", "<leader>W", ":w!<CR>:w!<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true })

vim.keymap.set("n", "<leader>,", ":let @+ = expand ('%:p')<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", ":bp<CR>", { silent = true })

vim.keymap.set("n", "<leader>cca", ":CodeCompanionActions<CR>", { silent = true })
vim.keymap.set("n", "<leader>ccc", ":CodeCompanionChat Toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ccd", ":CodeCompanionChat Add<CR>", { silent = true })

vim.api.nvim_set_keymap('n', '<leader>[', [[:lua ToggleCheckbox()<CR>]], { noremap = true, silent = true })

function ToggleCheckbox()
    local line = vim.api.nvim_get_current_line()
    if line:match('%- %[%s%]') then
        -- change [ ] to [x]
        line = line:gsub('%- %[%s%]', '- [x]')
    elseif line:match('%- %[x%]') then
        -- change [x] to [ ]
        line = line:gsub('%- %[x%]', '- [ ]')
    end
    vim.api.nvim_set_current_line(line)
end

return {}
