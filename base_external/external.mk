# Path to this external tree
BR2_EXTERNAL_PROJECT_BASE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
