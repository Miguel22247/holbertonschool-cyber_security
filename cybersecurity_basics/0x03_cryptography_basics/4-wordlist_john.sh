#!/bin/bash
[ -z "$1" ] && { echo "Usage: $0 hash.txt"; exit 1; } || (john --wordlist=/usr/share/wordlists/rockyou.txt "$1" && john --show "$1" > 4-password.txt)
