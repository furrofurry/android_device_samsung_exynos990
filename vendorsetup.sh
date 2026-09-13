#!/bin/bash

export ALLOW_MISSING_DEPENDENCIES=true

export FOX_BUILD_DEVICE="z3s"
export FOX_VANILLA_BUILD=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

# Dynamic partitions
export OF_ENABLE_ALL_PARTITION_TOOLS=1

# Samsung Keymaster
export OF_DEFAULT_KEYMASTER_VERSION="4.0"

# z3s is NOT an A/B device
export FOX_AB_DEVICE=0

# Android 16/API 36:
# DO NOT enable this for the first build.
#
# If recovery boots and the remaining decryption failure is specifically
# related to API 36 libc++/keystore2, test this later:
#
# export FOX_ADD_API_V36_PREBUILTS=2
