return {
	"saghen/blink.cmp",
	event = "LspAttach",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets" },
					})
				end,
			},
		},
		"Exafunction/codeium.nvim",
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			return vim.bo.filetype ~= "oil"
		end,

		keymap = {
			preset = "enter",
			["<C-j>"] = { "select_next", "fallback_to_mappings" },
			["<C-k>"] = { "select_prev", "fallback_to_mappings" },
			["<S-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		snippets = {
			preset = "luasnip",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			list = { selection = { preselect = true, auto_insert = false } },
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
									icon = require("lspkind").symbol_map[ctx.kind] or ""
								end

								return icon .. ctx.icon_gap
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
			-- "codeium"
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

		signature = { enabled = true, window = {
			show_documentation = false,
		} },

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
