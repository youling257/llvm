LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# opt command line tool
#===---------------------------------------------------------------===

llvm_opt_SRC_FILES := \
  AnalysisWrappers.cpp \
  BreakpointPrinter.cpp \
  GraphPrinters.cpp \
  NewPMDriver.cpp \
  PassPrinters.cpp \
  PrintSCC.cpp \
  opt.cpp \

llvm_opt_STATIC_LIBRARIES := \
  libLLVM11IRReader \
  libLLVM11BitReader \
  libLLVM11BitWriter \
  libLLVM11ARMCodeGen \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMDisassembler \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler \
  libLLVM11MipsCodeGen \
  libLLVM11MipsInfo \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmPrinter \
  libLLVM11MipsDisassembler \
  libLLVM11X86CodeGen \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11AsmPrinter \
  libLLVM11SelectionDAG \
  libLLVM11CodeGen \
  libLLVM11TransformObjCARC \
  libLLVM11Vectorize \
  libLLVM11ScalarOpts \
  libLLVM11Passes \
  libLLVM11ipo \
  libLLVM11Linker \
  libLLVM11InstCombine \
  libLLVM11Instrumentation \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11Object \
  libLLVM11ProfileData \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11Support \
  libLLVM11MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
