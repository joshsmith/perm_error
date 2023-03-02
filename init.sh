#!/bin/sh

echo "$0 running as '$(whoami)'"

VOL_DIR="/mnesia" mix run perm_error.exs

if touch /mnesia/file; then
	echo "/mnesia/file created or updated successfully"
else
	echo "Error creating /mnesia/file"
fi

# try creating subdirs
mkdir -p /mnesia/a/b/c || echo "ERROR"
touch /mnesia/a/b/c/d || echo "ERROR"

# List files with its permissions
find /mnesia -exec ls -ld {} \;

sleep inf

