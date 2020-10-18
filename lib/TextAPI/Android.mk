LOCAL_PATH:= $(call my-dir)

textapi_SRC_FILES := \
  ELF/ELFStub.cpp \
  ELF/TBEHandler.cpp \
  MachO/Architecture.cpp \
  MachO/ArchitectureSet.cpp \
  MachO/InterfaceFile.cpp \
  MachO/PackedVersion.cpp \
  MachO/Platform.cpp \
  MachO/Symbol.cpp \
  MachO/Target.cpp \
  MachO/TextStub.cpp \
  MachO/TextStubCommon.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(textapi_SRC_FILES)

LOCAL_MODULE:= libLLVM11TextAPI

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(textapi_SRC_FILES)

LOCAL_MODULE:= libLLVM11TextAPI

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
