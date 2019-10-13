#!/bin/bash
#
# Build and run the Docker container in dev mode (with an interactive shell).
#

# Errors are fatal
set -e

#
# Are we building/running the full version? (Lite version by default)
#
FULL=""
NAME="twint"
if test "$1" == "full"
then
	FULL=1
	NAME="twint-full"
fi


#
# Change to the parent of this script
#
pushd $(dirname $0) > /dev/null
cd ..

./bin/build.sh $@

echo "# "
echo "# Running Docker container '${NAME}' with interactive bash shell..."
echo "# "
docker run -v $(pwd):/mnt -it ${NAME} bash

