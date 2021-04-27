LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


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
  libLLVM12BitWriter \
  libLLVM12CodeGen \
  libLLVM12ipo \
  libLLVM12IRReader \
  libLLVM12BitReader \
  libLLVM12AsmParser \
  libLLVM12InstCombine \
  libLLVM12Instrumentation \
  libLLVM12Linker \
  libLLVM12TransformObjCARC \
  libLLVM12Object \
  libLLVM12ScalarOpts \
  libLLVM12TransformUtils \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12Core \
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12ProfileData \
  libLLVM12Vectorize \
  libLLVM12Support \

include $(CLEAR_VARS)

LOCAL_MODULE := bugpoint
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(bugpoint_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(bugpoint_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
