#!/usr/bin/env fish

set -l tmp (mktemp -d)

# XDG_CONFIG_HOME support is broken elsewhere in these dotfiles anyway. Whatever.
set -l cfg_home $HOME/.config

set -l repo_dir (realpath (dirname (status -f)))
set -l repo_reldir (string replace $HOME . $repo_dir)

pushd $HOME

if test -d $cfg_home
	mv $cfg_home $tmp
end

set -l old $HOME/config_old
mkdir $old

ln -s $repo_reldir/.config $cfg_home
for item in $tmp/.config/{*,.*}
	mv --no-clobber $item $cfg_home
	if test -e $item # if we couldn't move without clobbering
		mv $item $old # then move it to the place where old stuff goes
	end
end
rmdir $tmp/.config

for item in $repo_reldir/{*,.*}
	switch $item
		case .config .git .gitignore .gitmodules install.fish oh-my-fish
			continue

		case '*'
			set -l orig_item $HOME/(basename $item)
			if test -e $orig_item # if we would have to overwrite it
				mv $orig_item $old # then first move it to the place where old stuff goes
			end
			ln -s $item $HOME
	end
end

popd

rmdir $tmp
