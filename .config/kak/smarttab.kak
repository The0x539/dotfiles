plug "andreyorst/smarttab.kak" defer smarttab %{
	set-option global softtabstop 4
} config %{
	hook global WinSetOption filetype=.* smarttab
	hook global WinSetOption filetype=(rust) expandtab
}
