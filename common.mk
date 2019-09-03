#
# secuflag versioning
#

MOD_VERSION := PIE-R.02
AOSP_TAG_ID := android-9.0.0_r46

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

# Add extra apps to non-ATV target
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += \
    Terminal \
    Eleven
endif

# OpenGapps - non-ATV target
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
GAPPS_VARIANT := pico

GAPPS_PRODUCT_PACKAGES += \
    CalendarGooglePrebuilt \
    Chrome \
    LatinImeGoogle \
    PrebuiltGmail

GAPPS_EXCLUDED_PACKAGES := \
    CalendarGooglePrebuilt \
    GooglePackageInstaller \
    PrebuiltGmail

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif

# OpenGapps - ATV target
ifeq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += TvProvision
include vendor/google/atv/atv-vendor.mk
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.mod.version=$(MOD_VERSION) \
    ro.aosptag.id=$(AOSP_TAG_ID)

