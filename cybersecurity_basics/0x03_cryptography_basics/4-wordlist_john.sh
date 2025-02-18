#!/bin/bash
[ -z "$1" ] && { echo "Usage: $0 hash.txt"; exit 1; } || john --format=raw-md5 --wordlist=rockyou.txt "$1"
