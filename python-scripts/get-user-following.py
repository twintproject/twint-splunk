#!/usr/bin/python3

import sys

import twint

c = twint.Config()

user = "dmuth"
if len(sys.argv) > 1:
	user = sys.argv[1]

# Must be an increment of 20, according to Twint
num_followers = 20

print("# Looking up {} followers of a single user: {}".format(num_followers, user), flush=True)

c.Username = user
c.Limit = num_followers

twint.run.Following(c)


