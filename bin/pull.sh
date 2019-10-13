#!/bin/bash
#
# Pull container(s) from Docker Hub.
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

echo "# "
echo "# Pulling container '${NAME}' from Docker Hub..."
echo "# "
docker pull dmuth1/${NAME}

echo "# "
echo "# Tagging container '${NAME}'..."
echo "# "
docker tag dmuth1/${NAME} ${NAME}


echo "# Done!"

