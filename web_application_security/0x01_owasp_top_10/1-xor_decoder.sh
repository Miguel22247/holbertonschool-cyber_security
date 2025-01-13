#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./1-xor_decoder.sh {xor}encoded_string"
  exit 1
fi

# Remove the {xor} prefix
encoded=$(echo "$1" | sed 's/{xor}//')

# Base64 decode the input, preserving null bytes
decoded=$(echo "$encoded" | base64 -d 2>/dev/null)

# Check if Base64 decoding succeeded
if [ $? -ne 0 ]; then
  echo "Error: Invalid Base64 input."
  exit 1
fi

# Define XOR key
key=95

# Perform XOR decoding using `xxd` to handle null bytes
decoded_message=$(printf "%s" "$decoded" | xxd -p -c1 | while read -r byte; do
    # XOR each byte with the key
    xor_byte=$(printf "0x%x" "$((0x$byte ^ $key))")
    printf "\\$(printf '%03o' "$((xor_byte))")"
done)

# Output the decoded message
echo "$decoded_message"

