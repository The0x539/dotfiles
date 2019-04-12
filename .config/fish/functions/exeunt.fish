# Defined in /tmp/fish.4TmGuH/exeunt.fish @ line 2
function exeunt --description 'alias exeunt=kill (jobs -p | tail -n+1); and exit'
	kill (jobs -p | tail -n+1)
	and wait
	and exit $argv
end
