# Defined in - @ line 1
function ytdl --wraps=youtube-dl --description 'alias ytdl=youtube-dl'
  youtube-dl  $argv;
end
