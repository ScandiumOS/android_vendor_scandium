# Inherit common stuff
$(call inherit-product, vendor/scandium/config/common.mk)

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# World SPN overrides list
PRODUCT_COPY_FILES += \
    vendor/scandium/prebuilt/common/etc/spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/spn-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/scandium/prebuilt/common/etc/selective-spn-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/selective-spn-conf.xml
