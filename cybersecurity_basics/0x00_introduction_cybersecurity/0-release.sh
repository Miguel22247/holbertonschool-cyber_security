#!/bin/bash
# Display the distributor ID in a concise single-line output
lsb_release -i | cut -d: -f2 | tr -d '[:space:]'