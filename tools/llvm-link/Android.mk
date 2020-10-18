LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM11Linker \
  libLLVM11IRReader \
  libLLVM11Object \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11BitReader \
  libLLVM11BitWriter \
  libLLVM11AsmParser \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11Core \
  libLLVM11Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif
