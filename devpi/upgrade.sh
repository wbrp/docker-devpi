#!/bin/sh
#
# Replace the server dir with the contents from the server-upgrade dir.
# Can't just rename the directories as these are docker volumes (results
# in "Resource busy" errors).

DST=/devpi/server
SRC=/devpi/server-upgrade

# Remove old server data
find $DST -mindepth 1 -delete

# Move new server data
find $SRC -maxdepth 1 -mindepth 1 -exec mv {} $DST \;
