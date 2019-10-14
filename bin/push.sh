#!/bin/bash
#
# Push our Docker container(s) to Docker Hub.
#

# Errors are fatal
set -e

#
# Are we building/running the full version? (Lite version by default)
#
FULL=""
NAME="twint-lite"
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

echo "# "
echo "# Pushing container '${NAME}' to Docker Hub..."
echo "# "
docker push dmuth1/${NAME}
if test "$NAME" == "twint-lite"
then
	docker push dmuth1/twint
fi


echo "# Done!"

