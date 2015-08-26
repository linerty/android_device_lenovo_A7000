LOCAL_PATH := device/lenovo/A7000

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/recovery/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/kernel:kernel \
    $(LOCAL_PATH)/recovery/recovery.fstab:root/recovery.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := A7000

# recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/file_contexts:root/file_contexts \
#	$(LOCAL_PATH)/recovery/property_contexts:root/property_contexts \
#	$(LOCAL_PATH)/recovery/seapp_contexts:root/seapp_contexts \
#	$(LOCAL_PATH)/recovery/sepolicy:root/sepolicy \
#	$(LOCAL_PATH)/recovery/service_contexts:root/service_contexts \
	$(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc

# Set insecure for root access and device specifics
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1
