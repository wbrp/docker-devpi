#!/bin/sh
#
# Replace the server dir with the contents from the server-upgrade dir.

SRC=/devpi/server
DST=/devpi/server-upgrade

# Remove old server data
rm -r $SRC/*
rm -r $SRC/.*

# Move new server data
mv $DST/* $SRC/
mv $DST/.* $SRC/
