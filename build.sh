#!/usr/bin/env bash
set -euo pipefail
# ensure BR2_EXTERNAL is always visible to buildroot and Kconfig tools
export BR2_EXTERNAL="$(pwd)/base_external"
echo "build.sh: using BR2_EXTERNAL=$BR2_EXTERNAL"

cd buildroot

# Pass BR2_EXTERNAL explicitly to make too (helps sub-makes)
make BR2_EXTERNAL="$BR2_EXTERNAL" "$@"
cd ..
