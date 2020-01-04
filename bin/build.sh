#!/bin/bash
#
# Build our Docker container.
#

# Errors are fatal
set -e

#
# Are we building/running the full version? (Lite version by default)
#
FULL=""
NAME="twint-lite"
DOCKERFILE="Dockerfile-lite"
if test "$1" == "full"
then
	FULL=1
	NAME="twint-full"
	DOCKERFILE="Dockerfile-full"
fi

#
# Change to the parent of this script
#
pushd $(dirname $0) > /dev/null
cd ..

echo "# "
echo "# Building Docker container '${NAME}'..."
echo "# "
docker build . -f ${DOCKERFILE} -t ${NAME}

echo "# "
echo "# Tagging Docker container ${NAME}..."
echo "# "
docker tag ${NAME} dmuth1/${NAME}
if test "$NAME" == "twint-lite"
then
	docker tag twint-lite dmuth1/twint
fi

echo "# Done!"


