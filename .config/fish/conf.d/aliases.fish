alias edit '$EDITOR'
alias e '$EDITOR'

if type -q lazygit
    alias lg lazygit
end

if type -q yt-dlp
    alias ytdl yt-dlp
else if type -q youtube-dl
    alias ytdl youtube-dl
end

if type -q exa
    alias ls 'exa --time-style iso --classify'
    alias ll 'ls -l'
    alias la 'll -a'
end

if type -q bat
    alias cat bat
end
