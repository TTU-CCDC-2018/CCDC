#!/bin/bash
origin=/home/owner/Downloads/passwd_original.txt
filename=/etc/passwd
prompt=$'Discrepancies found in users:\n'

# Check for changes
text=$(diff $origin $filename|awk -F: '{print $1,$3}'| cat)

# Show a message only if there are changes found by diff
if [ -n "$text" ]; then
	xmessage -center "$prompt"+"$text"
fi
exit
