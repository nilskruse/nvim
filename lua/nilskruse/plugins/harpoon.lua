return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED


		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "[A]dd mark" })
		vim.keymap.set("n", "<A-Tab>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<A-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-4>", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<A-!>", function()
			mark.set_current_at(1)
		end)
		vim.keymap.set("n", '<A-">', function()
			mark.set_current_at(2)
		end)
		vim.keymap.set("n", "<M-S-3>", function()
			mark.set_current_at(3)
		end)
		vim.keymap.set("n", "<A-$>", function()
			mark.set_current_at(4)
		end)
	end,
}
