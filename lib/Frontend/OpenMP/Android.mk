LOCAL_PATH:= $(call my-dir)

frontendopenmp_SRC_FILES := \
  OMPContext.cpp \
  OMPIRBuilder.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(frontendopenmp_SRC_FILES)

LOCAL_MODULE:= libLLVM11FrontendOpenMP

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(LLVM11_GEN_OMP_GEN_MK)
include $(LLVM11_GEN_OMP_CPP_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(frontendopenmp_SRC_FILES)

LOCAL_MODULE:= libLLVM11FrontendOpenMP

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(LLVM11_GEN_OMP_GEN_MK)
include $(LLVM11_GEN_OMP_CPP_MK)
include $(BUILD_STATIC_LIBRARY)
endif
