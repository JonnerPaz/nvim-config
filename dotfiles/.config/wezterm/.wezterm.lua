local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ==========================================
-- 1. Integración con WSL (Fedora 43)
-- ==========================================
-- WezTerm crea dominios automáticos para WSL.
-- Asegúrate de que el nombre coincida exactamente con lo que arroja el comando `wsl -l -v` en PowerShell.
config.default_domain = "WSL:FedoraLinux-44"

-- (Alternativa) Si el dominio de arriba no funciona, comenta la línea anterior y descomenta la siguiente:
-- config.default_prog = { 'wsl.exe', '-d', 'Fedora-43', '--cd', '~' }

-- ==========================================
-- 2. Apariencia y Tema (Moderno)
-- ==========================================
-- Catppuccin es excelente para reducir la fatiga visual y tiene un contraste impecable.
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Abernathy"
config.color_scheme = "Moonfly"

-- Efecto de desenfoque y transparencia (Funciona de maravilla en Windows 11)
config.window_background_opacity = 0.85
config.win32_system_backdrop = "Acrylic" -- Puedes cambiarlo a 'Mica' o 'Tabbed' en Windows 11

-- ==========================================
-- 3. Tipografía
-- ==========================================
-- Es crucial usar una Nerd Font para que los íconos de la terminal y de editores de texto carguen bien.
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"FiraCode Nerd Font",
	"Consolas",
})
config.font_size = 13.5
config.line_height = 1.1 -- Un ligero espaciado extra para mejor legibilidad

-- ==========================================
-- 4. Interfaz de Usuario (UI)
-- ==========================================
-- Diseño minimalista: oculta la barra de pestañas si solo hay una abierta
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Márgenes internos para que el texto no quede pegado a los bordes de la ventana
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

-- Ocultar los controles nativos de Windows (minimizar, maximizar, cerrar) para un look más limpio.
-- config.window_decorations = "RESIZE"

-- ==========================================
-- 5. Rendimiento y Compatibilidad
-- ==========================================
-- Forzar el renderizado por hardware para mayor fluidez
config.front_end = "WebGpu"

-- Asegurar que la terminal reporte soporte para 256 colores (vital para temas de Neovim/vim)
config.term = "xterm-256color"

return config
