return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<F3>",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },

			-- lua = { lsp_format = "fallback" },
			-- rust = { lsp_format = "fallback", stop_after_first = false },
			sql = { "sql_formatter" },
			-- xml = { "xmllint" },
			-- yaml = { "yamlfix" },
			-- ["*"] = { "injected" },
		},
	}
}
