vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open file explorer
vim.keymap.set("n", "<leader>vf", vim.cmd.NvimTreeOpen)

-- Moves to beginning or end of a line
vim.keymap.set({ "n", "v" }, "H", "0^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Moves half page up/down
vim.keymap.set("n", "J", "10j", { desc = "Move cursor half page down" })
vim.keymap.set("n", "K", "10k", { desc = "Move cursor half page up" })

-- Copy and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+p', { desc = "[P]aste from system clipboard" })

-- Center cursor during searches
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev search result" })

-- LSP keymaps
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, { desc = "[G]o to [T]ype definition" })
vim.keymap.set("n", "<Leader><Leader>", function() vim.lsp.buf.hover() end, { desc = "View hover documentation" })
vim.keymap.set("n", "<Leader>d", function() vim.diagnostic.jump({ count =  1 }) end, { desc = "Next [D]iagnostic"})
vim.keymap.set("n", "<Leader>D", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous [D]iagnostic" })
vim.keymap.set("n", "<Leader>ss", function() vim.lsp.buf.workspace_symbol() end, { desc = "[S]earch [S]ymbol" })
vim.keymap.set("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, { desc = "[C]ode [A]ctions" })
vim.keymap.set("n", "<Leader>rr", function() vim.lsp.buf.references() end, { desc = "View [R]eferences" })
vim.keymap.set("n", "<Leader>rn", function() vim.lsp.buf.rename() end, { desc = "[R]e[N]ame Symbol" })
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature [H]elp" })
vim.keymap.set("i", "<C-j>", function()
    if vim.fn.pumvisible() == 0 then
        vim.lsp.completion.get()
    else
        local key = vim.api.nvim_replace_termcodes("<C-e>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", false)
    end
end, { desc = "Completion Menu" })
