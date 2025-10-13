set fish_greeting

for x in local cargo yarn npm-packages
    fish_add_path ~/.$x/bin
end

if set -q fish_private_mode
    export fish_private_mode
end

if which starship >/dev/null 2>/dev/null
    starship init fish | source
end

# https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory#fish
if set -q WT_SESSION
    function __wt_store_path --on-variable PWD
        printf '\e]9;9;%s\e\\' (wslpath -w (pwd))
    end
end

# NixOS hack: the file named below checks whether certain programs exist,
# but their paths aren't added to the environment until later in startup.
# User conf.d is the earliest config location, while config.fish is the latest.
source ~/.config/fish/conf.d/aliases.fish
