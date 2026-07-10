# Neovim configuration file

<!--toc:start-->
- [Requirements](#requirements)
- [Instructions](#instructions)
<!--toc:end-->

My own Neovim configuration file written 100% in lua. Sometimes it makes me quit using it, but it is fun tho.

## Requirements

- Neovim >= 0.11
- [fnm](https://github.com/Schniz/fnm) - for mason install all LSP server using node
- [ripgrep](https://github.com/BurntSushi/ripgrep) - Fuzzy finder engine
- [tree-sitter-cli](https://github.com/tree-sitter/tree-sitter-cli) - Syntax highlighting
    - You need to have cargo installed
    - To install it, run `cargo install tree-sitter-cli`

## Instructions

1. Install Neovim >= 0.11
2. Install [fnm](https://github.com/Schniz/fnm) and [ripgrep](https://github.com/BurntSushi/ripgrep)
3. Clone this repository
4. Move this file to `~/.config/nvim` (rename nvim-config to nvim)
5. Prepare your editor to explode and fix small bugs before using it 

