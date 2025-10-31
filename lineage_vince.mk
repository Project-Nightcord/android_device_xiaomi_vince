#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from vince device
$(call inherit-product, device/xiaomi/vince/device.mk)

# Axion Flags
AXION_MAINTAINER := RenzAlt
AXION_PROCESSOR := MSM8953_(Titanium_64)
AXION_CAMERA_REAR_INFO := 13
AXION_CAMERA_FRONT_INFO := 5
TARGET_IS_LOW_RAM := true

# Blur
TARGET_ENABLE_BLUR := false

# High Brightness Mode (HBM)
HBM_SUPPORTED := false

ifneq ($(WITH_GMS),true)
TARGET_INCLUDES_LOS_PREBUILTS := true
endif

# Kernel
TARGET_KERNEL_VERSION := 4.9

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vince
PRODUCT_NAME := lineage_vince
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 5 Plus
PRODUCT_MANUFACTURER := Xiaomi

# Build Name
BUILD_USERNAME := RenzAlt
BUILD_HOSTNAME := nigo-at25

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="vince-user 8.1.0 OPM1.171019.019 V11.0.2.0.OEGMIXM release-keys" \
    BuildFingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys
