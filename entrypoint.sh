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

elif test "$ARG" == "--run-python-script"
then

	if test ! "$2"
	then
		echo "! "
		echo "! --run-python script specified, but no file specified as arg!"
		echo "! "
		exit 1

	elif test ! -f "$2"
	then
		echo "! "
		echo "! --run-python-script specified, but file $2 does not exist!"
		echo "! "
		exit 1
	fi

	SCRIPT=$2
	shift 2

	#
	# Change into our directory so that scripts are run from here.
	#
	cd /python-scripts

	echo "# "
	echo "# Excuting Python script ${SCRIPT} with these args: $@"
	echo "# "
	exec $SCRIPT $@

fi

#
# We're running twint directly!
# Change to /mnt since that should be linked to the host directory, then run.
#
cd /mnt
exec /usr/bin/twint $@

