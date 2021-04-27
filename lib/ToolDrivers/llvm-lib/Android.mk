LOCAL_PATH:= $(call my-dir)

LibDriver_SRC_FILES := \
  LibDriver.cpp

LibDriver_TBLGEN_TABLES12 := \
  Options.inc


# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES12 := $(LibDriver_TBLGEN_TABLES12)

LOCAL_MODULE:= libLLVM12LibDriver
LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(LibDriver_SRC_FILES)
TBLGEN_TABLES12 := $(LibDriver_TBLGEN_TABLES12)

LOCAL_MODULE:= libLLVM12LibDriver

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
