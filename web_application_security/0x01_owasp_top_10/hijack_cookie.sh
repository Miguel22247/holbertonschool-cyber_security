#!/bin/bash

# URL to fetch cookies from
URL="http://web0x01.hbtn/a1/hijack_session/"

# Number of requests to make
REQUEST_COUNT=30

# Array to store retrieved cookies
cookies=()

# Fetch cookies
echo "Fetching $REQUEST_COUNT cookies from $URL..."
for ((i = 1; i <= REQUEST_COUNT; i++)); do
    cookie=$(curl -s -I "$URL" | awk '/hijack_session/ {print $2}')
    if [ -n "$cookie" ]; then
        cookies+=("$cookie")
    fi
    echo "Cookie $i: $cookie"
done

# Display all cookies
echo -e "\n--- All Retrieved Cookies ---"
printf "%s\n" "${cookies[@]}"

# Analyze unique cookies
unique_cookies=($(printf "%s\n" "${cookies[@]}" | sort | uniq))
echo -e "\n--- Unique Cookies ---"
printf "%s\n" "${unique_cookies[@]}"

# Detect possible patterns
echo -e "\n--- Pattern Analysis ---"
if [[ ${#unique_cookies[@]} -gt 1 ]]; then
    echo "Possible unique patterns detected. Review the unique cookies for common elements."
else
    echo "No patterns detected. All cookies appear identical."
fi
