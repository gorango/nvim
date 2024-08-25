return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<M-l>",
				clear_suggestion = "<C-l>",
				accept_word = "<M-w>",
			},
			ignore_filetypes = { cpp = true },
			color = {
				suggestion_color = "#888888",
				cterm = 244,
			},
			log_level = "info",             -- set to "off" to disable logging completely
			disable_inline_completion = false, -- disables inline completion for use with cmp
			disable_keymaps = false         -- disables built in keymaps for more manual control
		})
	end,
}
