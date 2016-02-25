LOCAL_PATH := device/cross/cross77_3776
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/cross/cross77_3776/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6577
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_VFP := true

TARGET_BOOTLOADER_BOARD_NAME := cross77_3776

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
INTERNAL_BOOTIMAGE_ARGS += --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --second_offset 0x00f00000 --tags_offset 0x00000100 --board 1371811777

# fix this up by examining /proc/mtd on a running device
# For mediatek based devices, the file is /proc/dumchar_info
# for real partition usable size, look at '/proc/partitions'
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SECROIMAGE_PARTITION_SIZE := 6291456
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 629145600
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 628097024
#BOARD_CACHEIMAGE_PARTITION_SIZE := 537919488
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1072693248
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# to be fixed at a later time
# TARGET_KERNEL_SOURCE := kernel/mediatek/mt6577_kernel3.4-master/kernel
# TARGET_KERNEL_CONFIG := cm_cross77_3776_defconfig
TARGET_PREBUILT_KERNEL := device/cross/cross77_3776/kernel

BOARD_CUSTOM_BOOTIMG_MK := device/cross/cross77_3776/boot.mk

BOARD_HAS_NO_SELECT_BUTTON := true

# cm recovery stuff
BOARD_RECOVERY_SWIPE := true

# twrp recovery stuff
# remove unneeded features to make the generated image smaller.
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHIC_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_USB_STORAGE := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_SUPERSU := true
TWHAVE_SELINUX := false
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := 'ext4'
TW_CRYPTO_REAL_BLKDEV := '/dev/block/mmcblk0p6'
TW_CRYPTO_MNT_POINT := '/data/'
TW_CRYPTO_FS_OPTIONS := 'nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered'
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlights/brightness
TW_MAX_BRIGHTNESS :=255

#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/cross/cross77_3776/bluetooth
USE_OPENGL_RENDERER := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_WLAN_DEVICE := mediatek
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := '/dev/wmtWifi'
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := P2P

TARGET_GLOBAL_CFLAGS := -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS := -mfpu=neon -mfloat-abi=softfp

BOARD_RIL_CLASS := $(LOCAL_PATH)/ril

#BOARD_SEPOLICY_DIRS += \
    device/cross/cross77_3776/sepolicy

#BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    app.te \
    netd.te
