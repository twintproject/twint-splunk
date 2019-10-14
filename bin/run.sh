#!/bin/bash
#
# Wrapper to run our Twint container.
#

# Errors are fatal
set -e

#
# Are we running the full version? (Lite version by default)
#
NAME="twint-lite"
FULL=""
if test "$1" == "full"
then
	NAME="twint-full"
	FULL="full"
	shift
fi

#
# Change to the parent of this script
#
pushd $(dirname $0) > /dev/null
cd ..

./bin/build.sh ${FULL}

echo "# "
echo "# Running Docker container..."
echo "# "
echo "# Args: $@"
echo "# "
docker run -v $(pwd):/mnt dmuth1/${NAME} $@

