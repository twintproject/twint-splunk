#!/bin/bash
#
# Our entrypoint script.
#

# Errors are fatal
set -e

ARG=$1

if test "$ARG" == "bash"
then
	echo "# "
	echo "# Spawning an interactive bash shell in /mnt..."
	echo "# "

	cd /mnt
	exec /bin/bash
fi

#
# We're running twint directly!
# Change to /mnt since that should be linked to the host directory, then run.
#
cd /mnt
exec /usr/bin/twint $@

