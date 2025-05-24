vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<C-p>", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<Right>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<F12>", ":Lazy reload all<CR>")

vim.keymap.set({ "n" }, "<leader>n", function()
	local cur = vim.fn.expand("%")
	local num = cur:sub(-4, -4)
	local next = cur:sub(1, -5) .. (num + 1) .. ".rs"
	if vim.fn.filereadable(next) == 1 then
		vim.cmd("bd")
		vim.cmd("edit " .. next)
	else
		print("All problems solved for this topic.")
	end
end)
