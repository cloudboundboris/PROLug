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

EMAIL_REGEX='\b[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\{2,\}\b'
# Read the file line by line and redirect stderr. This is crude, cleaner solution I would use a function but not there yet

while IFS= read -r line
do
  echo "$line" | grep -E -o "$EMAIL_REGEX"
  $line 2>>$LOGFILE  

done < "$FILE"




