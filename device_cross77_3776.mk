$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/cross/cross77_3776/cross77_3776-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/cross/cross77_3776/overlay

LOCAL_PATH := device/cross/cross77_3776
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# twrp recovery fstab file.
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

# Audio	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system/usr/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/root/fstab:root/fstab \
	$(LOCAL_PATH)/root/init.mt6577.rc:root/init.mt6577.rc \
	$(LOCAL_PATH)/root/init.mt6577.usb.rc:root/init.mt6577.usb.rc \
	$(LOCAL_PATH)/root/ueventd.mt6577.rc:root/ueventd.mt6577.rc \

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.secure=1 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    ro.telephony.ril_class=cross77_3776RIL \
    persist.service.debuggable=1
	
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_cross77_3776
PRODUCT_DEVICE := cross77_3776
