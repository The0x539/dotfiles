alias edit '$EDITOR'
alias e '$EDITOR'

if type -q helix; and not type -q hx
    alias hx helix
end

if type -q lazygit
    alias lg lazygit
end

if type -q yt-dlp
    alias ytdl yt-dlp
else if type -q youtube-dl
    alias ytdl youtube-dl
end

if not status --is-interactive
    exit
end

if type -q eza
    alias ls 'eza --time-style iso --classify --git'
    alias ll 'ls -l'
    alias la 'll -a'
end

if type -q bat
    alias cat bat
end
