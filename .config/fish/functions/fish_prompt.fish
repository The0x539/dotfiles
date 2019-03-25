# Defined in /tmp/fish.WAeB9e/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	set -l realstatus $status
	if not set -q __git_cb
		set __git_cb ' ('(color $fish_color_end)(git branch ^/dev/null | grep \* | sed 's/* //')(color normal)')'
	end
	if [ $USER = 'root' ]
		set __cwd_color (color $fish_color_cwd_root)
	else
		set __cwd_color (color $fish_color_cwd)
	end
	echo -n $USER(color $fish_color_operator)@(color normal)(hostname)\ $__cwd_color(prompt_pwd_full)(color normal)
	echo -n $__git_cb
	echo
	if [ $realstatus != 0 ]
		echo -n "$realstatus "
	end
	echo -n "> "
end
