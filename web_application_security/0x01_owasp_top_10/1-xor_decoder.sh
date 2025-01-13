#!/bin/bash

# Decode the base64 input
decoded=$(echo "$1" | sed 's/{xor}//g' | base64 --decode)

# XOR each byte with 0x5f and build the result string
result=""
for (( i=0; i<${#decoded}; i++ )); do
  byte=$(printf '%d' "'${decoded:$i:1}")
  xor_byte=$((byte ^ 0x5f))
  result+=$(printf "\\$(printf '%03o' "$xor_byte")")
done

# Print the result
echo "$result"