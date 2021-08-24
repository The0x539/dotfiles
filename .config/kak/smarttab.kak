plug "andreyorst/smarttab.kak" defer smarttab %{
	set-option global softtabstop 4
} config %{
	hook global WinSetOption filetype=.* %{
		smarttab
		set-option window aligntab true
		set-option window indentwidth 0
	}
	hook global WinSetOption filetype=(rust) %{
		expandtab
		set-option window aligntab false
		set-option window indentwidth 4
	}
}
