# Tiva Run 1

Run an executable if it is approved by all the tiva members.

## INSTALL

First, you have to install the sudo dependency, if it is not present in your
distro.

	sudo: https://www.sudo.ws/

You have to include this directive in your /etc/sudoers file.

	#includedir /etc/sudoers.d

Then run the install script with root privileges.

	# ./install.sh

## RUN

After installed, you can run an executable with root privileges with the
command:

	$ sudo tiva-run ./executable.sh

The executable must have all the needed signatures to run. For more details,
please see the documentation in tests directory.
