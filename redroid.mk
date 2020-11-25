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

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Device modules
PRODUCT_PACKAGES += \
    egl.cfg \
    gralloc.goldfish \
    gralloc.ranchu \
    libGLESv1_CM_emulation \
    lib_renderControl_enc \
    libEGL_emulation \
    libGLES_android \
    libGLESv2_enc \
    libOpenglSystemCommon \
    libGLESv2_emulation \
    libGLESv1_enc \
    qemu-props \
    camera.goldfish \
    camera.goldfish.jpeg \
    camera.ranchu \
    camera.ranchu.jpeg \
    keystore.goldfish \
    keystore.ranchu \
    gatekeeper.ranchu \
    lights.goldfish \
    gps.goldfish \
    gps.ranchu \
    fingerprint.goldfish \
    sensors.goldfish \
    audio.primary.goldfish \
    audio.primary.goldfish_legacy \
    android.hardware.audio@2.0-service \
    vibrator.goldfish \
    power.goldfish \
    power.ranchu \
    fingerprint.ranchu \
    android.hardware.biometrics.fingerprint@2.1-service \
    sensors.ranchu \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    hwcomposer.goldfish \
    hwcomposer.ranchu \
    sh_vendor \
    vintf \
    toybox_vendor \
    CarrierConfig


# inherit from emulator.mk
PRODUCT_PACKAGES += \
    qemu-props \
    android.hardware.audio@2.0-service \
    android.hardware.biometrics.fingerprint@2.1-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    sh_vendor \
    vintf \
    toybox_vendor \
    CarrierConfig

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-service \
    android.hardware.gnss@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl

PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    android.hardware.camera.provider@2.4-service \
    android.hardware.camera.provider@2.4-impl \

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# need this for gles libraries to load properly
# after moving to /vendor/lib/
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0.vndk-sp\
    android.hardware.graphics.allocator@2.0.vndk-sp\
    android.hardware.graphics.mapper@2.0.vndk-sp\
    android.hardware.graphics.common@1.0.vndk-sp\
    libhwbinder.vndk-sp\
    libbase.vndk-sp\
    libcutils.vndk-sp\
    libhardware.vndk-sp\
    libhidlbase.vndk-sp\
    libhidltransport.vndk-sp\
    libutils.vndk-sp\
    libc++.vndk-sp\
    libRS_internal.vndk-sp\
    libRSDriver.vndk-sp\
    libRSCpuRef.vndk-sp\
    libbcinfo.vndk-sp\
    libblas.vndk-sp\
    libft2.vndk-sp\
    libpng.vndk-sp\
    libcompiler_rt.vndk-sp\
    libbacktrace.vndk-sp\
    libunwind.vndk-sp\
    liblzma.vndk-sp\
    libz.vndk-sp\


PRODUCT_COPY_FILES += \
    device/generic/goldfish/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml \
    device/generic/goldfish/data/etc/permissions/privapp-permissions-goldfish.xml:system/etc/permissions/privapp-permissions-goldfish.xml \
    device/generic/goldfish/data/etc/config.ini:config.ini \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_CHARACTERISTICS := emulator

PRODUCT_BRAND := ReDroid

PRODUCT_MODEL := ReDroid 8.1.0

PRODUCT_FULL_TREBLE_OVERRIDE := true

PLATFORM_SECURITY_PATCH := 2018-12-05

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

## Hardware components
PRODUCT_PACKAGES += \
	gralloc.minigbm \
	libGLES_mesa

PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.goldfish.rc:root/init.goldfish.rc \
	$(LOCAL_PATH)/init.redroid.rc:system/etc/init.redroid.rc \
	$(LOCAL_PATH)/boot_completed.redroid.sh:system/etc/boot_completed.redroid.sh \
	$(LOCAL_PATH)/fstab.goldfish:root/fstab.goldfish \
	$(LOCAL_PATH)/redroid.xml:system/etc/permissions/redroid.xml \

# Extend heap size we use for dalvik/art runtime
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
