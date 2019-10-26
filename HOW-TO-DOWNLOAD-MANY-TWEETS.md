

# How To Download Many Tweets

This tool is fine for occasional one-off use, but because Twint is CPU-intensive,
if you want to do extended crawling of a user's Twitter timeline or even
crawl multiple timelines at the same time, I recommend spinning up a virtual
machine and running Twint there.  This document will show you how.


## Prerequisites

- An account on <a href="https://m.do.co/c/2bfeb888d8df">Digital Ocean</a>
- Installing the <a href="https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client">doctl app</a>
- Uploading an SSH public key to your Digital Ocean account.


## Creating a Droplet and Fetching Tweets

- Create a droplet: `doctl compute droplet create twint --size s-3vcpu-1gb --image ubuntu-18-04-x64 --region nyc1 --ssh-keys $( doctl compute ssh-key list --no-header | head -n1 | awk '{print $3}' )`
   - As of this writing, the above command will create a Droplet with 3 CPUs running Ubuntu 18, and will cost $15/mo or 2.2 cents/hour.
- Next, copy up your <a href="https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/">tmux</a> configuration files.  You are using tmux, right?  I recommend running it on your droplet so that you can disconnect and let long-running instances of Twint continue to run:
   - `scp ~/.tmux* root@$(doctl compute droplet list twint --format PublicIPv4 --no-header):.`
- Now, SSH in, install Docker, and clone this app:
   - `doctl compute ssh twint`
   - `apt-get update`
   - `apt-get install -y docker.io pv`
   - `docker run hello-world`
   - `git clone git@github.com:dmuth/twint-splunk.git`
   - `cd twint-splunk`
- Back on your machine, if you have run Twint locally and wish to copy up your `logs/` directory, do so with:
   - `rsync -avz logs/ root@$(doctl compute droplet list twint --format PublicIPv4 --no-header):twint-splunk/logs`
- On the Droplet again run `tmux` and then grab a user's tweets with this command:
   - `./twint-user-by-year USERNAME 2005 2019 | pv -l > /dev/null`
- Back on your machine, you can download all tweets and destroy the Droplet when you're done:
   - `rsync -avz root@$(doctl compute droplet list twint --format PublicIPv4 --no-header):twint-splunk/logs/ logs/`
   - `doctl compute droplet delete twint -f`
   - Make a backup of the tweets: ` tar cfvz ~/Dropbox/tweets.tgz logs/`
   - Finally, start up Splunk with `./bin/devel.sh` or `./bin/run.sh` and go to <a href="https://localhost:8000/">https://localhost:8000/</a>


