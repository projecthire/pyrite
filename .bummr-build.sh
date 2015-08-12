#!/bin/sh
MAX_TRIES=4
COUNT=0
EXIT=0

while [ $COUNT -lt $MAX_TRIES ] && [ $EXIT -eq 0 ]; do
  git log --pretty=format:'%s' -n 1
  echo "\nRunning test suite... $COUNT of $MAX_TRIES"
  bundle exec rake
  let EXIT=$?
  let COUNT=COUNT+1
done

exit $EXIT
