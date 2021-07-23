plug "andreyorst/powerline.kak" defer powerline %{
	powerline-format global ''
	powerline-separator global triangle
} config %{
	powerline-start
}

hook global ModuleLoaded powerline %{
	require-module powerline_dracula
	powerline-format global 'mode-info git lsp filetype bufname client session line-column position'
	powerline-theme dracula
}

provide-module powerline_dracula %§
	set-option -add global powerline_themes "dracula"

	define-command -hidden powerline-theme-dracula %{
		declare-option -hidden str powerline_color00 "%opt{green}"  # fg: bufname
		declare-option -hidden str powerline_color01 "%opt{black}"  # bg: position
		declare-option -hidden str powerline_color02 "%opt{black}"  # fg: git
		declare-option -hidden str powerline_color03 "%opt{black}"  # bg: bufname
		declare-option -hidden str powerline_color04 "%opt{orange}" # bg: git
		declare-option -hidden str powerline_color05 "%opt{yellow}" # fg: position
		declare-option -hidden str powerline_color06 "%opt{black}"  # fg: line-column
		declare-option -hidden str powerline_color07 "%opt{black}"  # fg: mode-info
		declare-option -hidden str powerline_color08 "default"      # base background
		declare-option -hidden str powerline_color09 "%opt{yellow}" # bg: line-column
		declare-option -hidden str powerline_color10 "%opt{black}"  # fg: filetype
		declare-option -hidden str powerline_color11 "%opt{green}"  # bg: filetype
		declare-option -hidden str powerline_color12 "%opt{purple}" # fg: client
		declare-option -hidden str powerline_color13 "%opt{black}"  # bg: client
		declare-option -hidden str powerline_color14 "%opt{black}"  # bg: session
		declare-option -hidden str powerline_color15 "%opt{purple}" # fg: session
		declare-option -hidden str powerline_color16 "%opt{orange}" # fg: lsp
		declare-option -hidden str powerline_color17 "%opt{black}" # fg: lsp

		set-face global StatusLineMode "%opt{cyan}+bi"
		set-face global StatusLineInfo "%opt{pink}"
		set-face global Information "%opt{powerline_color00},%opt{powerline_color03}"

		declare-option -hidden str powerline_next_bg "%opt{powerline_color08}"
		declare-option -hidden str powerline_base_bg "%opt{powerline_color08}"
	}
§
