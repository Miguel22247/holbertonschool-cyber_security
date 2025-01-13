#!/bin/bash
input="$1"
input="${input#'{xor}'}"
decopwd=$(echo "$input" | base64 -d)

decripted_input=""
key=95
for ((i = 0; i < ${#decripted_input}; i++)); do
    char="${decripted_input:$i:1}"
    ascii_value=$(printf "%d" "'$char")
    xor_result=$(( ascii_value ^ $key ))
    decopwordxor+="$(printf "$(printf '\\x%x' $xor_result)")"
done

echo -e "$decopwordxor"