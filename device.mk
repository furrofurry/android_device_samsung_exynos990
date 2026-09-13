#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Samsung TEE-backed credential and encryption services.  The implementation
# and its stock libraries are supplied by the repositories in
# twrp.dependencies.
PRODUCT_SOONG_NAMESPACES += \
    hardware/samsung \
    vendor/samsung/universal9830-common \
    vendor/samsung/z3s

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper-service.teegris \
    android.hardware.keymaster@4.0-service.samsung \
    android.hardware.keymaster@4.0_strongbox-service \
    libkeymaster4_1support.vendor \
    libkeymaster_helper \
    libskeymaster4device \
    tzdaemon \

$(call soong_config_set,samsungVars,target_keymaster4_library,//vendor/samsung/universal9830-common:libskeymaster4device)

# Install both common and Galaxy S20 Ultra TEEGRIS trustlet sets without
# pulling unrelated runtime blobs into the recovery ramdisk.
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/samsung/universal9830-common/proprietary/vendor/tee,$(TARGET_COPY_OUT_VENDOR)/tee) \
    $(call find-copy-subdir-files,*,vendor/samsung/z3s/proprietary/vendor/tee,$(TARGET_COPY_OUT_VENDOR)/tee)

# Match the metadata-encryption parameters used by Android on Exynos 990.
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.metadata_init_delete_all_keys.enabled=true \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=aes-256-xts:aes-256-cts:v2

# Screen
TARGET_SCREEN_WIDTH := 1440
TARGET_SCREEN_HEIGHT := 3200

# Manual workaround for common tree
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)
