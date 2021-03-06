LOCAL_PATH:= $(call my-dir)

binary_format_SRC_FILES := \
  AMDGPUMetadataVerifier.cpp \
  Dwarf.cpp \
  MachO.cpp \
  Magic.cpp \
  Minidump.cpp \
  MsgPackDocument.cpp \
  MsgPackDocumentYAML.cpp \
  MsgPackReader.cpp \
  MsgPackWriter.cpp \
  Wasm.cpp \
  XCOFF.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM12BinaryFormat

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(binary_format_SRC_FILES)

LOCAL_MODULE:= libLLVM12BinaryFormat

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
