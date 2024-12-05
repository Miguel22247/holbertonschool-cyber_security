#!/bin/bash
lsb_release -i | grep -oP 'Distributor ID:\s+\K\w+'