#!/bin/bash
for a in $(ls -1A); do
	if [ "$a" != "install.sh" ]; then
		ln -sf $(pwd | tr -d "\n")/$a ~/
	fi
done
