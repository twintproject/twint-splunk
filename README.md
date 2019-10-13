
Work in progress!

I will add to this README as parts of this project become usable. :-)


## Sample Usage

- This command will download every tweet I wrote in the year 2019 and write them to the file `tweets.txt` in the current directory:
   - `bash <(curl -s https://raw.githubusercontent.com/dmuth/twint-splunk/master/twint) -u dmuth -o tweets.txt --resume resume-user-dmuth.txt --year 2020 --since 2019-01-01`
- This command uses the `twint-user` helper script and does the same, except tweets will be written in JSON format to `logs/user/dmuth/tweets.json` and a resume file of `resume-user-dmuth.txt` will automatically be used:
   - `bash <(curl -s https://raw.githubusercontent.com/dmuth/twint-splunk/master/twint-user) dmuth --year 2020 --since 2019-01-01`

As of this writing (13 Oct 2019), I can download 2,028 tweets in 2 minutes, 15 seconds. So that's a rate of 15 tweets/sec.  Not bad!


## Development

- `./bin/build.sh [ full ]` - Build Docker image. For all scripts where `full` is available, if it is speicfied as the first argument, the full (with Pandas) verison will be built.  Otherwise, the Lite version will be built.
- `./bin/devel.sh [ full ]` - Build Docker image and spawn interactive shell.
- `./bin/push.sh [ full ]` - Push Docker image to Docker Hub.
- `./bin/pull.sh [ full ]` - Pull Docker image from Docker Hub.
- `./bin/run.sh [ full ] args` - Run for production use. Additional args should be passed in on the command line.


## Bugs/TODO

- If you try writing a file to a directory that is not under the current directory, Docker will likely have path issues.


