#!/bin/bash
notmuch address --format=json --output=recipients --deduplicate=address "$1" | \
  jq -r '.[] | "\(.address)\t\(.name)"' | \
  sort | uniq -c | sort -rn | \
  sed 's/^ *[0-9]* //'
