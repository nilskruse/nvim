return {
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
			sql = { "sql_formatter" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			-- xml = { "xmlformatter" },
		},
		-- formatters = {
		-- 	xmlformatter = {
		-- 		-- ✅ Mason stellt das Binary bereit
		-- 		args = {
		-- 			"--indent",
		-- 			"4",
		-- 			"--preserve-attributes",
		-- 			"--selfclose",
		-- 			"-",
		-- 		},
		-- 	},
		-- },
	},
}
