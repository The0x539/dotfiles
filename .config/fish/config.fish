set fish_greeting

for x in local cargo yarn npm-packages
    fish_add_path ~/.$x/bin
end

if set -q fish_private_mode
    export fish_private_mode
end

# https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory#fish
if set -q WT_SESSION
    function __wt_store_path --on-variable PWD
        printf '\e]9;9;%s\e\\' (wslpath -w (pwd))
    end
end

# a subtler statusline for `less` (mostly expected to be used with man, I think?)
set -x LESS_TERMCAP_so (set_color --background 44475a)
set -x LESS_TERMCAP_se (printf '\e[0m')

if test -f /etc/NIXOS
    # NixOS hack: the file named below checks whether certain programs exist,
    # but their paths aren't added to the environment until later in startup.
    # User conf.d is the earliest config location, while config.fish is the latest.
    source ~/.config/fish/conf.d/aliases.fish
else
    type -q starship; and starship init fish | source
    type -q batman; and batman --export-env | source
end
