#!/bin/bash

# Check if a file was provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

# Define regex
email_regex='[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Za-z]\{2,\}'

# Parse 
echo "Lines containing email addresses:"
echo "--------------------------------"

while IFS= read -r line || [ -n "$line" ]; do
    if echo "$line" | grep -q "$email_regex"; then
        echo "$line"
    fi
done < "$1"
