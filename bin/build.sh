#!/bin/bash

# Errors are fatal
set -e

#
# Change to the parent of this script
#
pushd $(dirname $0) > /dev/null
cd ..

echo "# "
echo "# Building Docker container..."
echo "# "
docker build . -f Dockerfile -t twint

echo "# "
echo "# Tagging Docker container..."
echo "# "
docker tag twint dmuth1/twint

echo "# Done!"


