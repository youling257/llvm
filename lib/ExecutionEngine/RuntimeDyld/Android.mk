LOCAL_PATH:= $(call my-dir)

runtimedyld_SRC_FILES := \
  RTDyldMemoryManager.cpp \
  RuntimeDyldChecker.cpp \
  RuntimeDyld.cpp \
  RuntimeDyldCOFF.cpp \
  RuntimeDyldELF.cpp \
  RuntimeDyldMachO.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVMRuntimeDyld

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(runtimedyld_SRC_FILES)
LOCAL_MODULE := libLLVMRuntimeDyld

include $(LLVM_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
