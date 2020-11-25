-include device/generic/x86_64/BoardConfig.mk

TARGET_USES_HWC2 := true

SMALLER_FONT_FOOTPRINT := false                                                                                            
MINIMAL_FONT_FOOTPRINT := false

BUILD_EMULATOR_OPENGL := false

BUILD_QEMU_IMAGES := true

BOARD_GPU_DRIVERS := i915 i965 nouveau

BOARD_USES_MINIGBM := true

