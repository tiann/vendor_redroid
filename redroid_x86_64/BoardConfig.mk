include device/generic/x86_64/BoardConfig.mk

# want all fonts
SMALLER_FONT_FOOTPRINT := false
MINIMAL_FONT_FOOTPRINT := false

# use seperate vendor partition
TARGET_COPY_OUT_VENDOR := vendor

BOARD_GPU_DRIVERS := i915 i965 nouveau
BOARD_USES_MINIGBM := true

PLATFORM_VERSION_MAJOR := $(word 1, $(subst ., ,$(PLATFORM_VERSION)))
DEVICE_MANIFEST_FILE := vendor/redroid/manifest.$(PLATFORM_VERSION_MAJOR).xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true
