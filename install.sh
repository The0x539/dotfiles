#!/bin/bash
for a in $(ls -1A); do
	ln -sf $(pwd | tr -d "\n")/$a ~/
done
