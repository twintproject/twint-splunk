
Work in progress!

I will add to this README as parts of this project become usable. :-)


## Development

- `./bin/build.sh [ full ]` - Build Docker image. For all scripts where `full` is available, if it is speicfied as the first argument, the full (with Pandas) verison will be built.  Otherwise, the Lite version will be built.
- `./bin/devel.sh [ full ]` - Build Docker image and spawn interactive shell.
- `./bin/push.sh [ full ]` - Push Docker image to Docker Hub.
- `./bin/pull.sh [ full ]` - Pull Docker image from Docker Hub.
- `./bin/run.sh [ full ] args` - Run for production use. Additional args should be passed in on the command line.


