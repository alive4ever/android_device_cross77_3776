## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := cross77_3776

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/cross/cross77_3776/device_cross77_3776.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cross77_3776
PRODUCT_NAME := cm_cross77_3776
PRODUCT_BRAND := cross
PRODUCT_MODEL := A7S
PRODUCT_MANUFACTURER := cross
