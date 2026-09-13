#!/bin/bash

export ALLOW_MISSING_DEPENDENCIES=true

export FOX_BUILD_DEVICE="z3s"
export FOX_VANILLA_BUILD=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

# Dynamic partitions / fastbootd
export OF_ENABLE_ALL_PARTITION_TOOLS=1

# Samsung Keymaster 4.0
export OF_DEFAULT_KEYMASTER_VERSION="4.0"

# z3s is non-A/B
export FOX_AB_DEVICE=0

# Android 16 / API 36 experimental support.
# Leave disabled for the first build.
#
# export FOX_ADD_API_V36_PREBUILTS=2
