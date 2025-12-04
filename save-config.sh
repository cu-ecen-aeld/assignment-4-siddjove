#!/usr/bin/env bash
set -euo pipefail
export BR2_EXTERNAL="$(pwd)/base_external"
echo "save-config.sh: using BR2_EXTERNAL=$BR2_EXTERNAL"
cd buildroot
make BR2_EXTERNAL="$BR2_EXTERNAL" savedefconfig
cp defconfig ../base_external/configs/aesd_qemu_defconfig
cd ..
echo "Saved defconfig to base_external/configs/aesd_qemu_defconfig"
