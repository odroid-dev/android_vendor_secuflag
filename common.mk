#
# secuflag versioning
#

MOD_VERSION := PIE-R.19
AOSP_TAG_ID := android-9.0.0_r46

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/secuflag/overlay/

# Enable assistant on all devices
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true

# Expose SELinux settings
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# ADBlock file
PRODUCT_COPY_FILES += \
    vendor/secuflag/extra/hosts:system/etc/hosts

# Default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1

# Extra packages
PRODUCT_PACKAGES += \
    curl \
    nano

# Add extra apps to non-ATV target
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += \
    Eleven
endif

# OpenGapps - non-ATV target
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
include vendor/gapps/tablet/common.mk
endif

# OpenGapps - ATV target
ifeq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += TvProvision
include vendor/gapps/atv/atv-vendor.mk
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opengapps_installed=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.mod.version=$(MOD_VERSION) \
    ro.aosptag.id=$(AOSP_TAG_ID)
