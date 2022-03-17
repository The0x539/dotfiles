for x in local cargo yarn npm-packages
	fish_add_path ~/.$x/bin
end

if set -q fish_private_mode
	export fish_private_mode
end

if which starship >/dev/null 2>/dev/null
	starship init fish | source
end
