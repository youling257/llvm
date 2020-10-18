LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-size command line tool
#===---------------------------------------------------------------===

llvm_size_SRC_FILES := \
  llvm-size.cpp

llvm_size_STATIC_LIBRARIES := \
  libLLVM11Object               \
  libLLVM11MC                   \
  libLLVM11MCParser             \
  libLLVM11BitReader            \
  libLLVM11Core                 \
  libLLVM11Support

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-size
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_size_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_size_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
