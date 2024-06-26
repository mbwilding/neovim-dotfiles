return {
	"cbochs/grapple.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		scope = "git", -- also "git_branch"
		icons = true,
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>a", "<cmd>Grapple toggle<cr>",         desc = "Grapple toggle tag" },
		{ "<C-e>",     "<cmd>Grapple toggle_tags<cr>",    desc = "Grapple toggle tags" },
		-- { "<leader>K", "<cmd>Grapple toggle_scopes<cr>",  desc = "Grapple toggle scopes" },
		-- { "<leader>j", "<cmd>Grapple cycle forward<cr>",  desc = "Grapple cycle forward" },
		-- { "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
		{ "1",     "<cmd>Grapple select index=1<cr>", desc = "Grapple: Select 1" },
		{ "2",     "<cmd>Grapple select index=2<cr>", desc = "Grapple: Select 2" },
		{ "3",     "<cmd>Grapple select index=3<cr>", desc = "Grapple: Select 3" },
		{ "4",     "<cmd>Grapple select index=4<cr>", desc = "Grapple: Select 4" },
	},
}
