LOCAL_PATH:= $(call my-dir)

debuginfo_msf_SRC_FILES := \
  MappedBlockStream.cpp \
  MSFBuilder.cpp \
  MSFCommon.cpp \
  MSFError.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_msf_SRC_FILES)

LOCAL_MODULE:= libLLVM11DebugInfoMSF

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(debuginfo_msf_SRC_FILES)

LOCAL_MODULE:= libLLVM11DebugInfoMSF

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
