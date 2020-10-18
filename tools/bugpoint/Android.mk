LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# bugpoint command line tool
#===---------------------------------------------------------------===

bugpoint_SRC_FILES := \
  BugDriver.cpp       \
  CrashDebugger.cpp   \
  ExecutionDriver.cpp \
  ExtractFunction.cpp \
  FindBugs.cpp        \
  Miscompilation.cpp  \
  OptimizerDriver.cpp \
  ToolRunner.cpp      \
  bugpoint.cpp        \

bugpoint_STATIC_LIBRARIES := \
  libLLVM11BitWriter \
  libLLVM11CodeGen \
  libLLVM11ipo \
  libLLVM11IRReader \
  libLLVM11BitReader \
  libLLVM11AsmParser \
  libLLVM11InstCombine \
  libLLVM11Instrumentation \
  libLLVM11Linker \
  libLLVM11TransformObjCARC \
  libLLVM11Object \
  libLLVM11ScalarOpts \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11Core \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11ProfileData \
  libLLVM11Vectorize \
  libLLVM11Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
