#!/bin/bash
ps aux | grep -vE '\s0\s+0\s' | grep "^$1 "