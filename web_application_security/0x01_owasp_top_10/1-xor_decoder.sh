#!/bin/bash
decoded=$(echo "$1" | sed 's/{xor}//g' | base64 --decode)
result=""
for (( i=0; i<${#decoded}; i++ )); do
  result+=$(printf "\\$(printf '%03o' $(( $(printf '%d' "'${decoded:$i:1}") ^ 0x5f )) )")
done
echo "$result"