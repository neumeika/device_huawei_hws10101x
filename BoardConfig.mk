# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version

-include vendor/huawei/hws10101l/BoardConfigVendor.mk


# Huawei U9508 platform
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_KERNEL_CMDLINE := console=ttyS0 k3v2_pmem=1 vmalloc=512M androidboot.hardware=hws10101l mmcparts=mmcblk0:p1(xloader),p3(nvme),p4(misc),p5(splash),p6(oeminfo),p7(logo),p8(vrcb),p9(recovery2),p10(recovery),p11(boot),p12(modemimage),p13(modemnv),p14(modemnvm2),p15(cache),p16(system),p17(cust),p18(userdata),p19(reserve1),p20(reserve2),p21(reserve3),p22(data);mmcblk1:p1(sdcard2)
BOARD_KERNEL_PAGESIZE := 2048 
BOARD_KERNEL_BASE := 0x00000000

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p16
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_DATA_DEVICE := /dev/block/mmcblk0p22
BOARD_DATA_FILESYSTEM := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4294967296
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_PREBUILT_KERNEL := device/huawei/hws10101l/zImage

#Recovery
TARGET_RECOVERY_INITRC := device/huawei/hws10101l/recovery/init.rc
TARGET_RECOVERY_FSTAB := device/huawei/hws10101l/recovery/etc/recovery.fstab
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

#Graphics
BOARD_EGL_CFG := device/huawei/hws10101l/configs/egl.cfg
USE_OPENGL_RENDERER := true

# Probably is better without it
# HWComposer
#BOARD_USES_HWCOMPOSER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := false

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"

#Bluetooth
#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
#BOARD_USE_FROYO_LIBCAMERA := true
#BOARD_CAMERA_USE_GETBUFFERINFO := true
#BOARD_USE_CAF_LIBCAMERA := true
#USE_CAMERA_STUB := false
# BOARD_USE_REVERSE_FFC := true

# Gps

# Audio
#BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_QCOM_AUDIO_V2 := true
#BOARD_PREBUILT_LIBAUDIO := true
#TARGET_PROVIDES_LIBAUDIO := true
#BUILD_WITHOUT_PV := false

# HDMI
#TARGET_HAVE_HDMI_OUT := true

# FM Radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := tavarua


# Vold
#TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

# miscellaneus
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := k3v200


