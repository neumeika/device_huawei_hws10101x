# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of 
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/hws10101l/hws10101l-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/hws10101l/overlay



# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

LOCAL_PATH := device/huawei/hws10101l
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):zImage

# init files from Huawei initramfs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/init.1g.rc:root/init.1g.rc \
    $(LOCAL_PATH)/boot/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/boot/init.hws10101l.rc:root/init.hws10101l.rc \
    $(LOCAL_PATH)/boot/init.k3v2oem1.usb.rc:root/init.k3v2oem1.usb.rc \
    $(LOCAL_PATH)/boot/init.rc:root/init.rc \
    $(LOCAL_PATH)/boot/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/boot/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/boot/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    $(LOCAL_PATH)/boot/ueventd.hws10101l.rc:root/ueventd.hws10101l.rc \
    $(LOCAL_PATH)/boot/ueventd.rc:root/ueventd.rc

# Install the features available on this device.
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/permissions/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
#    $(LOCAL_PATH)/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
#   $(LOCAL_PATH)/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
#    $(LOCAL_PATH)/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml 

# Include keyboards
$(call inherit-product-if-exists, device/huawei/hws10101l/keyboards/keyboards.mk)

# packages
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    com.android.future.usb.accessory \
    Torch \
#    Camera 

# HAL
PRODUCT_PACKAGES += \
	librs_jni \
    libhwconverter \
    libs5pjpeg \
    libfimg

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# MFC API
PRODUCT_PACKAGES += \
    libsecmfcapi

# OMX
PRODUCT_PACKAGES += \
   LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    Gallery3d \
    SpareParts \
    Term \
    librs_jni \
    CMFileManager\
    Superuser\
    libOmxCore \
    libOmxVdec

# mount points SDCARDS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/internal_sd.fstab:system/etc/internal_sd.fstab \
    $(LOCAL_PATH)/configs/external_sd.fstab:system/etc/external_sd.fstab

#video
# PRODUCT_COPY_FILES += 
#	 $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Audio
#PRODUCT_COPY_FILES += \

# Camera
#PRODUCT_PACKAGES := \
#    Camera

# Sensors (Proprietry)
#GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gpsconfig.xml:system/etc/gpsconfig.xml 

# Wifi 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf 

# Bluetooth 
# Include initscripts
$(call inherit-product-if-exists, device/huawei/hws10101l/initscripts/initscripts.mk)



# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs


$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, build/target/product/full.mk)

PRODUCT_DEVICE := hws10101l
PRODUCT_NAME := full_hws10101l
