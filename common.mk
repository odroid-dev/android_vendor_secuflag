#
# secuflag versioning
#

MOD_VERSION := PIE-R.02
AOSP_TAG_ID := android-9.0.0_r46

# OpenGapps
GAPPS_VARIANT := pico

GAPPS_PRODUCT_PACKAGES += \
    CalendarGooglePrebuilt \
    Chrome \
    LatinImeGoogle \
    PrebuiltGmail

GAPPS_EXCLUDED_PACKAGES := \
    PrebuiltGmail \
    CalendarGooglePrebuilt

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/secuflag/overlay/

# SetupWizard
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#    ro.setupwizard.enterprise_mode=1

# Enable assistant on all devices
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true

# Expose SELinux settings
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# ADBlock file
PRODUCT_COPY_FILES += \
    vendor/secuflag/extra/hosts:system/etc/hosts

# Terminal
PRODUCT_PACKAGES += \
    Terminal

# Eleven
# https://github.com/LineageOS/android_packages_apps_Eleven
PRODUCT_PACKAGES += \
    Eleven

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.secuflag.version=$(MOD_VERSION) \
    ro.aosptag.id=$(AOSP_TAG_ID)

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
