return {
	init_options = {
		-- config options here: https://docs.astral.sh/ruff/editors/settings/#configuration
		-- configuration = "~/path/to/ruff.toml",
		settings = {
			configurationPreference = "filesystemFirst",
			lineLength = 80,
			organizeImports = true,
			configuration = {
				lint = {
					unfixable = { "F401" },
					["extend-select"] = { "TID251" },
					["flake8-tidy-imports"] = {
						["banned-api"] = {
							["typing.TypedDict"] = {
								msg = "Use `typing_extensions.TypedDict` instead",
							},
						},
					},
					preview = true,
					select = { "E4", "E7", "E9", "F", "B", "Q" },
				},
				format = {
					["quote-style"] = "double",
				},
			},
		},
	},
}
