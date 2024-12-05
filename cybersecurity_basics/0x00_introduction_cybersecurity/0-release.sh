#!/bin/bash
lsb_release -a | grep "Distributor ID:" | cut -d ":" -f2 | tr -d "[:blank:]"