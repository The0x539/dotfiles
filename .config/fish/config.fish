set -U fish_user_paths ~/.local/bin ~/.cargo/bin ~/.yarn/bin

if which starship >/dev/null 2>/dev/null
	starship init fish | source
end
