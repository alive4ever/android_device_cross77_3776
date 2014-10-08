USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/cross/cross77_3776/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := cross77_3776

BOARD_KERNEL_CMDLINE := 
# BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fixed by examining /proc/partitions, multiplied by 1024
BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 628097024
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1072693248
# BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_MKBOOTIMG_ARGS := 0x11000000

TARGET_PREBUILT_KERNEL := device/cross/cross77_3776/kernel

BOARD_HAS_NO_SELECT_BUTTON := true