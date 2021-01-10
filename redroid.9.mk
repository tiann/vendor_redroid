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

PRODUCT_SOONG_NAMESPACES += external/mesa3d

# Arm64 linker failed, complain unsupported TLS DT entry
# caused by libclang_rt.ubsan_standalone-aarch64-android.so ??
# AUDIOSERVER_MULTILIB := first

# ?
PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.nobootanimation=1

# required by sync.sh script
PRODUCT_PACKAGES += \
	fs_config

PRODUCT_PACKAGES += \
	vncserver \
	hwcomposer.redroid \
	gralloc.redroid \
	gatekeeper.ranchu \
	libEGL_swiftshader \
	libGLESv1_CM_swiftshader \
	libGLESv2_swiftshader \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.qemu=1 \
	ro.hardware=redroid \
	ro.hardware.gatekeeper=ranchu \
	ro.sf.lcd_density=320 \

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
	audio.r_submix.default \
	android.hardware.audio@2.0-service \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.configstore@1.1-service \
	android.hardware.drm@1.0-service \
	android.hardware.drm@1.0-impl \
	android.hardware.drm@1.1-service.clearkey \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.composer@2.1-service \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.mapper@2.0-impl \
	android.hardware.keymaster@3.0-service \
	android.hardware.keymaster@3.0-impl \


PRODUCT_COPY_FILES += \
	device/generic/goldfish/camera/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
	frameworks/av/media/libeffects/data/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
	device/generic/goldfish/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \


# Extend heap size we use for dalvik/art runtime
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

