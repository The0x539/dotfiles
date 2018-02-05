function prompt_pwd_full
	set -q fish_prompt_pwd_dir_length; or set -l fish_prompt_pwd_dir_length 1

	if [ $fish_prompt_pwd_dir_length -eq 0 ]
		set -l fish_prompt_pwd_dir_length 99999
	end

	set -l realhome ~
	pwd | sed -e "s|^$realhome|~|" -e 's-\([^/.]{'"$fish_prompt_pwd_dir_length"'}\)[^/]*/-\1/-g'
end
