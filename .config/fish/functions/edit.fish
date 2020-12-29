# Defined in - @ line 1
function edit --wraps='$EDITOR' --description 'alias edit=$EDITOR'
  $EDITOR  $argv;
end
