# Copyright (C) 2013 The Android Open Source Project
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

PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

AUDIOSERVER_MULTILIB := first

# We don't want telephony support for now
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes

# Disable boot-animation permanently
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.nobootanimation=1

PRODUCT_PACKAGES += \
	vncserver \
	hwcomposer.redroid \
	gralloc.redroid \
	libEGL_swiftshader \
	libGLESv1_CM_swiftshader \
	libGLESv2_swiftshader \
	getcap \
	setcap

PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.qemu=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware=goldfish \
	ro.hardware.sensors=ranchu \
	ro.hardware.gatekeeper=ranchu \
	ro.hardware.hwcomposer=redroid \
	ro.hardware.gralloc=redroid \

PLATFORM_VERSION_MAJOR := $(word 1, $(subst ., ,$(PLATFORM_VERSION)))

ifneq ($(filter 10, $(PLATFORM_VERSION_MAJOR)), )
# Android 10
PRODUCT_PACKAGES += \
	android.hardware.audio@4.0-impl \
	android.hardware.audio.effect@4.0-impl \

else
PRODUCT_PACKAGES += \
    gralloc.minigbm \
    gralloc.minigbm_intel \
    gralloc.minigbm_meson \
    libGLES_mesa

endif

PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.goldfish.rc:root/init.goldfish.rc \
	$(LOCAL_PATH)/init.redroid.rc:system/etc/init.redroid.rc \
	$(LOCAL_PATH)/boot_completed.redroid.sh:system/etc/boot_completed.redroid.sh \
	$(LOCAL_PATH)/fstab.goldfish:root/fstab.goldfish \
	$(LOCAL_PATH)/redroid.xml:system/etc/permissions/redroid.xml \

# Extend heap size we use for dalvik/art runtime
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
