# Neovim configuration file

<!--toc:start-->

- [Requirements](#requirements)
- [Instructions](#instructions)

<!--toc:end-->

My own Neovim configuration file written 100% in lua. Sometimes it makes me quit using it, but it is fun tho.

## Requirements

### Core

- Neovim >= 0.12
- `git`, `curl`, `unzip` — required by `lazy.nvim` and `mason.nvim`
- [ripgrep](https://github.com/BurntSushi/ripgrep) + [fzf](https://github.com/junegunn/fzf) — fuzzy finder engine for `fzf-lua` (`fd` optional but recommended)
- [fnm](https://github.com/Schniz/fnm) + Latest Node.js LTS — required by `mason`
  for LSPs/formatters/linters that run on Node:
  ```bash
  fnm install --lts
  fnm use lts-latest
  node -v  # should be >= 18
  ```
- [cargo](https://rustup.rs) (Rust toolchain) + [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter-cli) — syntax highlighting and parsers:
  ```bash
  cargo install tree-sitter-cli
  ```

### Language Toolchains (auto-installed via `mason-tool-installer`, but host binaries needed)

- **Python 3 + pip** — `basedpyright`, `ruff`, `black` (`lua/plugins/lsp/mason.lua:12`, `lua/plugins/conform.lua:16`)
- **Rust** (`cargo`, `rustc`) — `rust_analyzer`, `rustfmt` (`mason.lua:17`, `conform.lua:20`)
- **Lua** — `lua_ls`, `stylua` (`mason.lua:13`, `conform.lua:8`)
- **C/C++** — `clangd`, `clang-format` (`mason.lua:16`, `conform.lua:17`)
- **SQL** — `postgres_lsp`, `sql_formatter` (`mason.lua:15`, `conform.lua:19`)
- **JSON/YAML/Markdown** — `jsonls`, `yamlls`, `marksman` (`mason.lua:11`, `mason.lua:22`)

### Tailwind CSS

- Node.js >= 18 and a Tailwind project:
  - **v4:** `@import "tailwindcss"` in your CSS (no `tailwind.config.js` required, e.g. `app.css`)
  - **v3:** `tailwind.config.{js,cjs,mjs,ts}` at project root
- `tailwindcss-language-server` — auto-installed via `mason-tool-installer` as `tailwindcss` (`lua/plugins/lsp/mason.lua:23`, `lsp/tailwindcss.lua`)
- `rustywind` — Tailwind class sorter for sorting on save (Option A: `conform.nvim` + `rustywind`):
  ```bash
  cargo install rustywind       # or via mason: :MasonInstall rustywind
  # mason-tool-installer ensures: tailwindcss, rustywind, stylua, prettierd, eslint_d
  ```
  Sorting chain: `rustywind` → `prettierd` for `javascript, typescript, javascriptreact, typescriptreact, html, astro` (`lua/plugins/conform.lua:9-14`). Supports Tailwind v4 since `rustywind` 0.23.
- `tailwind-tools.nvim` (`lua/plugins/lsp/tailwind.lua`) — color preview inline (`󰝤 `), conceal, Telescope — filetypes: `html, css, javascript, typescript, javascriptreact, typescriptreact, astro` (React + Astro only, no vue/svelte)

### Optional but Recommended

- `stylua`, `prettierd`, `eslint_d` — auto-installed but can be installed manually via `mason` or `cargo`/`npm`
- `fd` — faster file finding for `fzf-lua`

## Instructions

1. Install Neovim and core deps: `git`, `curl`, `unzip`, `ripgrep`, `fzf`, `cargo`, `fnm`, `python3` + `pip`
2. Setup Node via `fnm`:
   ```bash
   fnm install --lts
   fnm use lts-latest
   corepack enable
   ```
3. Install Rust tools:
   ```bash
   cargo install tree-sitter-cli rustywind
   ```
4. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```
5. Rename `nvim-config` to nvim and place it on `~/.config/nvim`
6. First launch — install plugins & LSPs:
   ```bash
   nvim
   # inside nvim:
   :Lazy sync
   :Mason          # verify: html, cssls, tailwindcss, rustywind, etc. are installed
   :checkhealth    # should show OK for tailwind-tools, tailwindcss, rustywind
   ```
7. Prepare your editor to explode and fix small bugs before using it
