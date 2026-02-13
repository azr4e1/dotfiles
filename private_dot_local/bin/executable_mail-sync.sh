#!/usr/bin/bash

# do not duplicate
MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
    exit 0
fi

#run mbsync once for all accs with named configs file, with quiet interface
# or specify account name as argument and define separate cron tasks for each acc

if [[ -n "$1" ]]; then
    mbsync -q $1
else
    mbsync -a -q
fi

# Index new mail and capture count
NEW_COUNT=$(notmuch new 2>&1 | grep -oP 'Added \K\d+' | head -1)

# Notify if new mail
if [[ -n "$NEW_COUNT" ]] && [[ "$NEW_COUNT" -gt 0 ]]; then
    message="message"
    if [[ "$NEW_COUNT" -gt 1 ]]; then
        message="messages"
    fi
    notify-send -u normal -a "Mail" "New Mail" "$NEW_COUNT new $message"  # -i "mail-unread"
fi
