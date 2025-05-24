return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "[A]dd mark" })
		vim.keymap.set("n", "<A-Tab>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<A-1>", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<A-2>", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<A-3>", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<A-4>", function()
			ui.nav_file(4)
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
