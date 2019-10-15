#!/bin/bash
#
# Kill our Splunk Lab container.
#

NAME="splunk-twint"

echo "# Killing container '${NAME}'..."
docker kill ${NAME}
echo "# Done!"

