#!/usr/bin/bash

# do not duplicate
MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
    exit 0
fi

#run mbsync once for all accs with named configs file, with quiet interface
# or specify account name as argument and define separate cron tasks for each acc
notmuch search --format=text0 --output=files tag:deleted | xargs -0 --no-run-if-empty rm -v

mbsync -a -q
notmuch new

