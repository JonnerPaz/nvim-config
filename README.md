# Configuración de neovim

<!--toc:start-->

- [Configuración de neovim](#configuración-de-neovim)
  - [Requisitos](#requisitos)
  - [Estructura de plugins](#estructura-de-plugins)
  - [Uso](#uso)
  <!--toc:end-->

Archivo de configuración de neovim basado 100% en lua. Para la realización de este archivo se tomó
como inspiración el video de [ThePrimeagen](https://www.youtube.com/watch?v=w7i4amO_zaE)

## Requisitos

- Neovim >= 0.9
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- Node instalado
  - Paquetes:
    - Prettier <code>npm i -g prettier</code>
    - stylua <code>cargo install stylua</code>

## Estructura de plugins

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

## Uso

El archivo de configuración debe estar ubicado en sistemas unix en <code>~/.config/nvim/</code>.
Una vez que se haya ubicado, usar neovim y se instalarán automáticamente todos los paquetes
necesarios.
