# Versioning System
# Xtended first version.
PRODUCT_VERSION_MAJOR = 10.0
PRODUCT_VERSION_MAINTENANCE = XQ
XTENDED_RELEASE_VERSION = Release-v5.5
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

