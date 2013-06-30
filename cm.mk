#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := HWS10101X

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/hws10101x/full_hws10101x.mk)

## Device identifier. This must come after all inclusions

PRODUCT_DEVICE := hws10101x
PRODUCT_MODEL := hws10101x
PRODUCT_NAME := cm_hws10101x
PRODUCT_BRAND := huawei
PRODUCT_MANUFACTURER := huawei

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=uhws10101x 
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Allow ADB (to access dev settings)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.debuggable=1 persist.sys.usb.config=mtp persist.service.adb.enable=1



