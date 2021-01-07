# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PLATFORM_VERSION_MAJOR := $(word 1, $(subst ., ,$(PLATFORM_VERSION)))
$(call inherit-product, $(LOCAL_PATH)/redroid.$(PLATFORM_VERSION_MAJOR).mk)
$(call inherit-product, $(LOCAL_PATH)/redroid_x86_64/device.mk)

PRODUCT_NAME := redroid_x86_64
PRODUCT_DEVICE := redroid_x86_64
PRODUCT_BRAND := ReDroid
PRODUCT_MODEL := ReDroid

PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay.$(PLATFORM_VERSION_MAJOR)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.redroid.$(PLATFORM_VERSION_MAJOR).rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.redroid.rc \
    $(LOCAL_PATH)/boot_completed.redroid.sh:$(TARGET_COPY_OUT_VENDOR)/bin/boot_completed.redroid.sh \

