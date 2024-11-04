#!/bin/bash

# check if file name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# read and display each line from the specified file
cat "$1" | while IFS='' read -r line; do
  echo "$line"
done
