# Neovim configuration file

<!--toc:start-->

- [Configuración de neovim](#configuración-de-neovim)
  - [Requirements](#requirements)
  - [Plugins' structure](#plugins-structure)
  <!--toc:end-->

My own Neovim configuration file written 100% in lua. Sometimes it makes me quit using it, but it is fun tho.

## Requirements

- Neovim >= 0.10
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Plugins' structure

```
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── init.lua
│   │   ├── lazy.lua
│   │   ├── remap.lua
│   │   └── set.lua
│   └── plugins
│       ├── configs
│       │   ├── lsp
│       │   │   ├── cmp.lua
│       │   │   ├── null_ls.lua
│       │   │   └── zero.lua
│       │   ├── themes
│       │   │   ├── catppuccin.lua
│       │   │   ├── colors.lua
│       │   │   ├── github.lua
│       │   │   ├── monokai-pro.lua
│       │   │   └── onedark.lua
│       │   ├── tools
│       │   │   ├── autotag.lua
│       │   │   ├── comment.lua
│       │   │   ├── fugitive.lua
│       │   │   ├── harpoon.lua
│       │   │   ├── telescope.lua
│       │   │   ├── tree.lua
│       │   │   ├── treesitter.lua
│       │   │   ├── trouble.lua
│       │   │   └── undotree.lua
│       │   └── ui
│       │       ├── colorPicker.lua
│       │       ├── lualine.lua
│       │       ├── todo.lua
│       │       ├── which-key.lua
│       │       └── zen.lua
│       ├── init.lua
│       ├── lsp.lua
│       ├── themes.lua
│       ├── tools.lua
│       └── ui.lua
├── README.md
├── TODO.md
└── utils
    └── formatting
```
