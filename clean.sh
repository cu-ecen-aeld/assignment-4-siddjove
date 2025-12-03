#!/bin/sh
# Clean Buildroot output for assignment 4
set -e

# Go into buildroot directory and run distclean
cd "$(dirname "$0")/buildroot"
make distclean
