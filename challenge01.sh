#!/bin/bash

# Check if a file was provided as an argument
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

FILE="$1"
LOGFILE="/var/log/my_script_err.log"

# Check if the provided file exists
if [[ ! -f "$FILE" ]]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

# Read the file line by line and redirect stderr. This is crude, cleaner solution I would use a function but not there yet
while IFS= read -r line
do
  $line 2>>$LOGFILE  
done < "$FILE"
