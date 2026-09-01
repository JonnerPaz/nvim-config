return {
	filetypes = {
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"astro",
	},
	settings = {
		tailwindCSS = {
			-- Enable class detection in Astro files as HTML
			includeLanguages = {
				astro = "html",
			},
			-- Support cva, clsx, cx, twMerge for React
			experimental = {
				classRegex = {
					-- cva("...") and cva(["..."])
					"cva\\(([^)]*)\\)",
					-- cx("...")
					"cx\\(([^)]*)\\)",
					-- clsx("..."), with capture inside quotes
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^'\"`]*)(?:'|\"|`)" },
					-- tailwind-merge: twMerge("...") / twJoin("...")
					{ "twMerge\\(([^)]*)\\)", "(?:'|\"|`)([^'\"`]*)(?:'|\"|`)" },
					{ "twJoin\\(([^)]*)\\)", "(?:'|\"|`)([^'\"`]*)(?:'|\"|`)" },
				},
			},
		},
	},
}
