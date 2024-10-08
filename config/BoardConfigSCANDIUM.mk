# Kernel
include vendor/scandium/config/BoardConfigKernel.mk

# Soong
include vendor/scandium/config/BoardConfigSoong.mk

# QCOM Specific
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/scandium/config/BoardConfigQcom.mk
endif

# Namespace for fwk-detect
TARGET_FWK_DETECT_PATH ?= hardware/qcom-caf/common
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_FWK_DETECT_PATH)/fwk-detect
