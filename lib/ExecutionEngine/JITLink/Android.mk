LOCAL_PATH:= $(call my-dir)

jitlink_SRC_FILES := \
  JITLink.cpp \
  JITLinkGeneric.cpp \
  JITLinkMemoryManager.cpp \
  EHFrameSupport.cpp \
  MachO.cpp \
  MachO_arm64.cpp \
  MachO_x86_64.cpp \
  MachOLinkGraphBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(jitlink_SRC_FILES)
LOCAL_MODULE := libLLVM11JITLink

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(jitlink_SRC_FILES)
LOCAL_MODULE := libLLVM11JITLink

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
