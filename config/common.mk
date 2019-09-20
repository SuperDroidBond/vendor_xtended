# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BRAND ?= MSM-XTENDED

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Default ringtone/notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.ringtone=Despacito.ogg,PerfectStrangers.ogg \
    ro.config.notification_sound=Doink.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.opa.eligible_device=true\
    ro.build.selinux=1 \
    persist.sys.dun.override=0 \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.sys.wfd.nohdcp=1  
    
# whitelist packages for location providers not in system
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Bootanimation
TARGET_BOOTANIMATION_480P := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -le 480 ]; then \
    echo 'true'; \
  else \
    echo ''; \
  fi )

# Bootanimation
ifeq ($(TARGET_BOOTANIMATION_480P),true)
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/bootanimation/bootanimation-480p.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip
endif

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
ifneq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/xtended/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/xtended/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/xtended/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/xtended/prebuilt/common/bin/50-xtended.sh:system/addon.d/50-xtended.sh

# system mount
PRODUCT_COPY_FILES += \
    vendor/xtended/build/tools/system-mount.sh:install/bin/system-mount.sh

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/xtended/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# Gzosp-specific init file
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/etc/init.local.rc:root/init.xtended.rc

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/etc/init.d/50selinuxrelabel:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/50selinuxrelabel

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/xtended/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/etc/permissions/xtended-power-whitelist.xml:system/etc/sysconfig/xtended-power-whitelist.xml

# whitelist packages for location providers not in system
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Permissions
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/etc/permissions/privapp-permissions-xtended.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-xtended.xml

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts
   
# XTENDED PACKAGES
PRODUCT_PACKAGES += \
    ExactCalculator \
    GalleryGoPrebuilt \
    GboardGoPreb \
    OmniJaws \
    WeatherIcons \
    PixelThemes \
    SettingsIntelligenceGooglePrebuilt \
    ThemePicker \
    Eleven \
    Jelly \
    Lawnchair

    
# CustomDoze
PRODUCT_PACKAGES += \
    CustomDoze

#ADB_ROOT
PRODUCT_PACKAGES += \
    adb_root

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Lawnchair
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/common/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/xtended/prebuilt/common/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Cutout control overlays
PRODUCT_PACKAGES += \
    HideCutout \
    StatusBarStock

# Accents
PRODUCT_PACKAGES += \
    AccentColorYellowOverlay \
    AccentColorVioletOverlay \
    AccentColorTealOverlay \
    AccentColorQGreenOverlay \
    AccentColorPinkOverlay \
    AccentColorLightPurpleOverlay \
    AccentColorIndigoOverlay \
    AccentColorFlatPinkOverlay \
    AccentColorCyanOverlay \
    AccentColorBlueGrayOverlay \
    AccentColorMintOverlay \
    AccentColorXtendedOverlay \
    AccentColorGradientIndianOverlay

# Build OTA for Official Only
#PRODUCT_PACKAGES += XOta

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Extra tools in Xtended
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem 

# Xtended Stuff - Copy to System fonts
PRODUCT_COPY_FILES += \
    vendor/xtended/prebuilt/fonts/gobold/Gobold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Gobold.ttf \
    vendor/xtended/prebuilt/fonts/gobold/Gobold-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Gobold-Italic.ttf \
    vendor/xtended/prebuilt/fonts/gobold/GoboldBold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldBold.ttf \
    vendor/xtended/prebuilt/fonts/gobold/GoboldBold-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldBold-Italic.ttf \
    vendor/xtended/prebuilt/fonts/gobold/GoboldThinLight.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldThinLight.ttf \
    vendor/xtended/prebuilt/fonts/gobold/GoboldThinLight-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoboldThinLight-Italic.ttf \
    vendor/xtended/prebuilt/fonts/roadrage/road_rage.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/RoadRage-Regular.ttf \
    vendor/xtended/prebuilt/fonts/neoneon/neoneon.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Neoneon-Regular.ttf \
    vendor/xtended/prebuilt/fonts/mexcellent/mexcellent.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Mexcellent-Regular.ttf \
    vendor/xtended/prebuilt/fonts/burnstown/burnstown.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Burnstown-Regular.ttf \
    vendor/xtended/prebuilt/fonts/dumbledor/dumbledor.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Dumbledor-Regular.ttf \
    vendor/xtended/prebuilt/fonts/PhantomBold/PhantomBold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/PhantomBold-Regular.ttf \
    vendor/xtended/prebuilt/fonts/snowstorm/snowstorm.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Snowstorm-Regular.ttf \
    vendor/xtended/prebuilt/fonts/vcrosd/vcr_osd_mono.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/ThemeableFont-Regular.ttf \
    vendor/xtended/prebuilt/fonts/Shamshung/Shamshung.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Shamshung.ttf \
    vendor/xtended/prebuilt/fonts/Aclonica/Aclonica.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Aclonica.ttf \
    vendor/xtended/prebuilt/fonts/Amarante/Amarante.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Amarante.ttf \
    vendor/xtended/prebuilt/fonts/Bariol/Bariol-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Bariol.ttf \
    vendor/xtended/prebuilt/fonts/Cagliostro/Cagliostro-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Cagliostro-Regular.ttf \
    vendor/xtended/prebuilt/fonts/Coolstory/Coolstory-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Coolstory-Regular.ttf \
    vendor/xtended/prebuilt/fonts/LGSmartGothic/LGSmartGothic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/LGSmartGothic.ttf \
    vendor/xtended/prebuilt/fonts/Rosemary/Rosemary-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Rosemary-Regular.ttf \
    vendor/xtended/prebuilt/fonts/SonySketch/SonySketch.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/SonySketch.ttf \
    vendor/xtended/prebuilt/fonts/Surfer/Surfer.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/Surfer.ttf

# Thermal Control Engine
#PRODUCT_PACKAGES += \
   ThermalController

PRODUCT_PACKAGES += \
    charger_res_images

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

PRODUCT_PACKAGES += \
    AndroidDarkThemeOverlay \
    SettingsDarkThemeOverlay

# Common overlay
DEVICE_PACKAGE_OVERLAYS += vendor/xtended/overlay/common

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Versioning System
# Xtended first version.
PRODUCT_VERSION_MAJOR = 10.0
PRODUCT_VERSION_MAINTENANCE = XQ
XTENDED_RELEASE_VERSION = Release-v4.0
XTENDED_POSTFIX := $(shell date +"%Y%m%d")
XTENDED_BUILD_EXTRA := By-Team-Xtended
ifndef XTENDED_BUILD_TYPE
    XTENDED_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
XTENDED_VERSION := Xtended-$(XTENDED_BUILD)-$(XTENDED_POSTFIX)-$(PRODUCT_VERSION_MAINTENANCE)-$(XTENDED_BUILD_TYPE)-$(XTENDED_RELEASE_VERSION)
XTENDED_MOD_VERSION := Xtended-$(XTENDED_BUILD)-$(XTENDED_POSTFIX)-$(PRODUCT_VERSION_MAINTENANCE)-$(XTENDED_BUILD_TYPE)-$(XTENDED_RELEASE_VERSION)
ROM_FINGERPRINT := Xtended-$(XTENDED_BUILD)-$(XTENDED_POSTFIX)-$(PRODUCT_VERSION_MAINTENANCE)-$(XTENDED_RELEASE_VERSION)
XTENDED_XTRA_VERSION := $(XTENDED_BUILD_TYPE)-$(PRODUCT_VERSION_MAINTENANCE)-$(XTENDED_RELEASE_VERSION)
XTENDED_DISPLAY_VERSION := $(XTENDED_XTRA_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    xtended.ota.version=$(XTENDED_VERSION) \
    ro.xtended.version=$(XTENDED_XTRA_VERSION) \
    ro.modversion=$(XTENDED_MOD_VERSION) \
    ro.xtended.buildtype=$(XTENDED_BUILD_TYPE) \
    ro.xtended.display.version=$(XTENDED_DISPLAY_VERSION) \
    com.xtended.fingerprint=$(ROM_FINGERPRINT)

EXTENDED_POST_PROCESS_PROPS := vendor/xtended/tools/xtended_process_props.py

# Fonts
PRODUCT_COPY_FILES += \
    vendor/xtended/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Regular.ttf \
    vendor/xtended/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Medium.ttf \
    vendor/xtended/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/xtended/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Italic.ttf \
    vendor/xtended/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-Bold.ttf \
    vendor/xtended/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_SYSTEM)/fonts/GoogleSans-BoldItalic.ttf

# Enable ccache
USE_CCACHE := true

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

