define-command -hidden normal-line-numbers %{
	add-highlighter -override window/ruler number-lines -hlcursor -separator ' '
}
define-command -hidden relative-line-numbers %{
	add-highlighter -override window/ruler number-lines -relative -hlcursor -separator ' '
}
define-command -hidden no-line-numbers %{
	remove-highlighter window/ruler
}

define-command -hidden update-ruler %{
	eval %sh{
		if [ "$kak_opt_readonly" = 'true' ]; then
			echo no-line-numbers
		elif [ "$kak_opt_normal_mode" = 'true' ] && [ "$kak_opt_focused" = 'true' ]; then
			echo relative-line-numbers
		else
			echo normal-line-numbers
		fi
	}
}

declare-option -hidden bool normal_mode
declare-option -hidden bool focused
hook global WinCreate '.*' %{
	set-option window normal_mode true
	set-option window focused true
	update-ruler
}

hook global ModeChange '.*:.*:normal' %{
	set-option window normal_mode true
	update-ruler
}
hook global ModeChange '.*:normal:.*' %{
	set-option window normal_mode false
	update-ruler
}
hook global FocusIn '.*' %{
	set-option window focused true
	update-ruler
}
hook global FocusOut '.*' %{
	set-option window focused false
	update-ruler
}

hook global WinSetOption 'readonly=.*' update-ruler
