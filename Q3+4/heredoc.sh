#!/bin/sh
#
#
#CGB	Wed  9 Dec 09:54:19 GMT 2020
#
#	Version: 0.0
#
#	Truelayer technical test

# Objective:
#  Using CAT EOF, write a simple script to take a folder and convert it to a form that can be
#  pasted into a shell script.
#
#  The script should then process it and restore the contents of the folder.
#
#  It should use a destination location defined by the script and preserve folder hierarchy
#
#   The folder should have at least 2 files, 1 of which could be binary
#   
#  The script should be totally contained not requiring any additonal files.


for CONTENTS="cat `ls -1`"

cat <<'EOF' >> restoration.point
#CGB	"${CONTENTS}"
EOF

