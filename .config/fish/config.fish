alias color "set_color"

function prompt_pwd_full
	set -q fish_prompt_pwd_dir_length; or set -l fish_prompt_pwd_dir_length 1

	if [ $fish_prompt_pwd_dir_length -eq 0 ]
		set -l fish_prompt_pwd_dir_length 99999
	end

	set -l realhome ~
	echo $PWD | sed -e "s|^$realhome|~|" -e 's-\([^/.]{'"$fish_prompt_pwd_dir_length"'}\)[^/]*/-\1/-g'
end

function fish_prompt --description 'Write out the prompt'
	if not set -q __git_cb
		set __git_cb ' ('(color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(color normal)')'
	end
	if [ $USER = 'root' ]
		set __cwd_color (color red)
	else
		set __cwd_color (color green)
	end
	echo -n $USER(color cyan)@(color normal)(hostname)\ $__cwd_color(prompt_pwd_full)(color normal)
	echo -n $__git_cb
	if [ $USER = 'root' ]
		printf '# '
	else
		printf '> '
	end
end
