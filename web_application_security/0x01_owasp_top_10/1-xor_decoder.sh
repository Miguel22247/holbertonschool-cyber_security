#!/bin/bash
input=$1
decoded=$(echo "$input" | base64 --decode)
key="websphere"

for ((i=0; i<${#decoded}; i++)); do
  printf \\$(printf '%03o' $(( $(printf '%d' "'${decoded:$i:1}") ^ $(printf '%d' "'${key:$((i % ${#key})):1}") )))
done
echo