# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

if not test -d "$OMF_PATH"
  if not set -q ____norecurse
    set -x ____norecurse
    pushd ~/dotfiles/oh-my-fish
    ./bin/install --offline
    popd
    set -x -e ____norecurse
  end
end
