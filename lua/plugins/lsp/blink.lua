return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	event = "LspAttach",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"rafamadriz/friendly-snippets",
		"Exafunction/codeium.nvim",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "enter",
			["<C-j>"] = { "select_next", "fallback_to_mappings" },
			["<C-k>"] = { "select_prev", "fallback_to_mappings" },
			["<S-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			keyword = { range = "full" },
			trigger = {
				show_on_keyword = true,
			},
			menu = {
				draw = {
					columns = {
						{ "label", "label_description" },
						{ "kind_icon", gap = 4, "source_name" },
					},
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return ctx.icon_gap .. icon
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "codeium" },

			per_filetype = {
				sql = { "dadbod" },
			},
			providers = {
				dadbod = { module = "vim_dadbod_completion.blink" },
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				codeium = { name = "Codeium", module = "codeium.blink", async = true },
			},
		},

		cmdline = {
			enabled = true,
			keymap = { preset = "cmdline" },
			completion = {
				list = { selection = { preselect = false } },
				menu = {
					auto_show = function()
						return vim.fn.getcmdtype() == ":"
					end,
				},
				ghost_text = { enabled = true },
			},
		},

		snippets = { preset = "luasnip" },

		signature = { enabled = true },

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = {
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
			implementation = "prefer_rust_with_warning",
		},
	},
	opts_extend = { "sources.default" },
}
