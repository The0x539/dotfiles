function fish_user_key_bindings
	# bang-bang
	bind ! __history_previous_command
	bind '$' __history_previous_command_arguments
	
	# symnav
	#set -l symnav_bind_mode default
	#bind -M $symnav_bind_mode \t __symnav_complete
	#bind -M $symnav_bind_mode \r __symnav_execute
	#bind -M $symnav_bind_mode \n __symnav_execute
end
