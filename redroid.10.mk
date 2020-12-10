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

AUDIOSERVER_MULTILIB := first

# ?
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.nobootanimation=1

# required by sync.sh script
PRODUCT_HOST_PACKAGES += \
	fs_config

PRODUCT_PACKAGES += \
	vncserver \
	hwcomposer.redroid \
	gralloc.redroid \
	libEGL_swiftshader \
	libGLESv1_CM_swiftshader \
	libGLESv2_swiftshader \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.qemu=1 \
	ro.hardware=redroid \
	ro.hardware.gatekeeper=ranchu \
	ro.sf.lcd_density=320 \
	persist.sys.fuse=1 \

# Phone App required
PRODUCT_PACKAGES += \
	rild

# WiFi required by SystemUI
PRODUCT_PACKAGES += \
	android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \


# required HIDL
PRODUCT_PACKAGES += \
	android.hardware.audio@2.0-service \
	android.hardware.audio@4.0-impl \
	android.hardware.audio.effect@4.0-impl \
	android.hardware.drm@1.0-service \
	android.hardware.drm@1.0-impl \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl \
	gatekeeper.ranchu \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.mapper@2.0-impl-2.1 \
	android.hardware.graphics.composer@2.1-service \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.health@2.0-service.goldfish \
	android.hardware.keymaster@3.0-service \
	android.hardware.keymaster@3.0-impl \

USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/boot_completed.redroid.sh:system/bin/boot_completed.redroid.sh \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_generic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/surround_sound_configuration_5_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_configuration_5_0.xml \

# Extend heap size we use for dalvik/art runtime
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
