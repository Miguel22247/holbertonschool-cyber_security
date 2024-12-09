#!/bin/bash
sudo whois "$1" | ',' '/^Registrant|^Admin|^Tech/{gsub(":", ",");print $0}' > $1.csv 