#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Platform
TARGET_BOARD_PLATFORM := msm8953

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    HapticOverlay

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck_ramdisk \
    tune2fs_ramdisk \
    resize2fs_ramdisk

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Use FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi \
    liblzma.vendor:64

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# Android Go Properties, cherry picked.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_DEX_PREOPT_GENERATE_DM_FILES := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify

# ART Debugging (Disable)
USE_DEX2OAT_DEBUG := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false

# Camera
PRODUCT_PACKAGES += \
    camera.msm8953

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)

# Power
$(call soong_config_set,qtipower,tap_to_wake_node,/sys/devices/platform/soc/78b7000.i2c/i2c-3/3-0020/input/input4/wake_gesture)
$(call soong_config_set,qtipower,interaction_boost,true)

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/vince/proprietary/vendor/bin/hvdcp_opti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hvdcp_opti

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom.ramdisk \
    init.xiaomi.device.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/vince/vince-vendor.mk)
