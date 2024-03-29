LOCAL_PATH:= $(call my-dir)

lto_SRC_FILES := \
  Caching.cpp \
  LTO.cpp \
  LTOBackend.cpp \
  LTOModule.cpp \
  LTOCodeGenerator.cpp \
  SummaryBasedOptimizations.cpp \
  UpdateCompilerUsed.cpp \
  ThinLTOCodeGenerator.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(lto_SRC_FILES)

LOCAL_MODULE:= libLLVM12LTO

LOCAL_MODULE_TAGS := optional

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(lto_SRC_FILES)

LOCAL_MODULE:= libLLVM12LTO

LOCAL_MODULE_TAGS := optional

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
