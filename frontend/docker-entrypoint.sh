#!/bin/bash
set -eo pipefail

# Script to replace `NEXT_PUBLIC_*` environment variables because they're set
# at build-time but we want to set them at runtime in `docker-compose.yml`

# The first part wrapped in a function
makeSedCommands() {
  printenv | \
      grep  '^NEXT_PUBLIC' | \
      sed -r "s/=/ /g" | \
      xargs -n 2 bash -c 'echo "sed -i \"s#APP_PLACEHOLDER_$0#$1#g\""'
}

# Set the delimiter to newlines (needed for looping over the function output)
IFS=$'\n'
# For each sed command
for c in $(makeSedCommands); do
  # For each file in the .next directory
  for f in $(find .next -type f); do
    # Execute the command against the file
    COMMAND="$c $f"
    eval $COMMAND
  done
done

echo "Starting Nextjs"
exec "$@"
