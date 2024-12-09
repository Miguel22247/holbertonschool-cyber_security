#!/bin/bash
whois "$1" | awk -F: ',' '/^Registrant|^Admin|^Tech/{gsub(":", ",");print $0}'