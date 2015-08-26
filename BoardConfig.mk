# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/lenovo/A7000

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lenovo/A7000/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := MT6752
TARGET_BOOTLOADER_BOARD_NAME := A7000
TARGET_OTA_ASSERT_DEVICE := A7000-a
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI_LIST := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT:= cortex-a9
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

WITH_DEXPREOPT := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40080000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x44000000 --tags_offset 0x4e000000 --board A7000 --cmdline bootopt=64S3,32N2,64N2
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/recovery/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/recovery/kernel
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/recovery/init.rc
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/recovery/recovery.fstab
BOARD_HAS_MTK := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/mkmtkbootimg.mk

# File systems
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x80000000
BOARD_CACHEIMAGE_PARTITION_SIZE :=  0x7000000
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x49c00000
TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_HAS_LARGE_FILESYSTEM := true  
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file
TWHAVE_SELINUX := true
#Fix Wipe
BOARD_NO_SECURE_DISCARD := true			# for cwm
BOARD_SUPPRESS_SECURE_ERASE := true		# for omni

# Graphics
TARGET_BOARD_PLATFORM_GPU := SGX351_110
DEVICE_RESOLUTION := 720x1280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1280
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"font28_17x33.h\"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

# MTK hacks for hw
# #TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
# #NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
# #TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
# # VSYNC_EVENT_PHASE_OFFSET_NS := -5000000
# #SF_VSYNC_EVENT_PHASE_OFFSET_NS := -5000000
# # PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# TWRP stuff
# #USE_MINIKIN := true						# Enable Minikin text layout engine (will be the default soon)
# #EXTENDED_FONT_FOOTPRINT := true			# Include an expanded selection of fonts
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/lenovo/A7000/recovery/graphics_5.1-mod.c
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/battery/power_supply/battery
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
RECOVERY_GRAPHICS_USE_LINELENGTH := true 	# fixes slanty looking graphics on some devices
RECOVERY_SDCARD_ON_DATA := true 			# this enables proper handling of /data/media on devices that have this folder for storage
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
SP1_NAME := "uboot"
SP1_BACKUP_METHOD := image
SP1_MOUNTABLE := 0
SP2_NAME := "nvram"
SP2_DISPLAY_NAME := "nvram"
SP2_BACKUP_METHOD := image
SP2_MOUNTABLE := 0

TW_FLASH_FROM_STORAGE := true 				# flashes zips from their current location instead of copying them to /tmp for ROMs that are too large to fit in RAM.
TW_NO_REBOOT_BOOTLOADER := true 			# removes the reboot bootloader button from the reboot menu
TW_DEFAULT_EXTERNAL_STORAGE := true 
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_USE_TOOLBOX := true
TW_EXCLUDE_SUPERSU := true
