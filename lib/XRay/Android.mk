LOCAL_PATH:= $(call my-dir)

xray_SRC_FILES := \
  InstrumentationMap.cpp \
  Trace.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM11XRay
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(xray_SRC_FILES)

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM11XRay
LOCAL_SRC_FILES := $(xray_SRC_FILES)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
