#completion for apt-mark

function __fish_apt_no_subcommand --description 'Test if apt has yet to be given the subcommand'
	for i in (commandline -opc)
		if contains -- $i auto manual hold unhold showauto showmanual showhold
			return 1
		end
	end
	return 0
end

function __fish_apt_use_package --description 'Test if apt command should have packages as potential completion'
	for i in (commandline -opc)
		if contains -- $i contains auto manual hold unhold
			return 0
		end
	end
	return 1
end

complete -c apt-mark -n '__fish_apt_use_package' -a '(__fish_print_packages)' --description 'Package'

complete -c apt-mark -s h -l help --description 'Display help and exit'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'auto' --description 'Mark a package as automatically installed'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'manual' --description 'Mark a package as manually installed'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'hold' --description 'Hold a package, prevent automatic installation or removal'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'unhold' --description 'Cancel a hold on a package'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'showauto' --description 'Show automatically installed packages'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'showmanual' --description 'Show manually installed packages'
complete -f -n '__fish_apt_no_subcommand' -c apt-mark -a 'showhold' --description 'Show held packages'
complete -c apt-mark -s v -l version --description 'Display version and exit'
complete -r -c apt-mark -s c -l config-file --description 'Specify a config file'
complete -r -c apt-mark -s o -l option --description 'Set a config option'
complete -r -c apt-mark -s f -l file --description 'Write package statistics to a file'
