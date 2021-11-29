declare-option -hidden str autofmt_formatter

define-command -hidden run-autofmt %{
	nop %sh{ $kak_opt_autofmt_formatter "${kak_buffile}" }
	edit!
}

define-command -hidden -params 1 activate-formatter %{
	set-option window autofmt_formatter %arg{1}

	hook window -group autofmt BufWritePost .* run-autofmt

	hook -once -always window WinSetOption filetype=.* %{
		remove-hooks window autofmt
	}
}

hook global WinSetOption "filetype=(python)" %{
	activate-formatter "black"
}
