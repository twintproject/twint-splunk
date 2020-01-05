#!/usr/bin/python3

import sys

import twint

c = twint.Config()

user = "dmuth"
if len(sys.argv) > 1:
	user = sys.argv[1]

# Must be an increment of 20, according to Twint
num_tweets = 20

print("# Looking up {} recent tweets of a single user: {}".format(num_tweets, user), flush=True)

c.Username = user
c.Limit = num_tweets

twint.run.Profile(c)


