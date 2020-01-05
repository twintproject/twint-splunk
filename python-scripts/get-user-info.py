#!/usr/bin/python3

import sys

import twint

c = twint.Config()

user = "dmuth"
if len(sys.argv) > 1:
	user = sys.argv[1]

print("# Looking up user info of a single user: {}".format(user))

c.Username = user

twint.run.Lookup(c)


