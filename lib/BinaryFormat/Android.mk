LOCAL_PATH:= $(call my-dir)

binary_format_SRC_FILES := \
  AMDGPUMetadataVerifier.cpp \
  Dwarf.cpp \
  Magic.cpp \
  MsgPackReader.cpp \
  MsgPackTypes.cpp \
  MsgPackWriter.cpp \
  Wasm.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM80BinaryFormat

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM80BinaryFormat

include $(LLVM80_DEVICE_BUILD_MK)
include $(LLVM80_GEN_ATTRIBUTES_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
