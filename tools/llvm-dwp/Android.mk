LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM11DebugInfoDWARF \
  libLLVM11Object \
  libLLVM11BitReader \
  libLLVM11ARMCodeGen \
  libLLVM11ARMAsmParser \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMDisassembler \
  libLLVM11MipsCodeGen \
  libLLVM11MipsInfo \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmParser \
  libLLVM11MipsAsmPrinter \
  libLLVM11MipsDisassembler \
  libLLVM11X86CodeGen \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmParser \
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler \
  libLLVM11ExecutionEngine \
  libLLVM11RuntimeDyld \
  libLLVM11MCJIT \
  libLLVM11OrcJIT \
  libLLVM11AsmPrinter \
  libLLVM11SelectionDAG \
  libLLVM11CodeGen \
  libLLVM11Object \
  libLLVM11ScalarOpts \
  libLLVM11InstCombine \
  libLLVM11Instrumentation \
  libLLVM11TransformObjCARC \
  libLLVM11TransformUtils \
  libLLVM11Vectorize \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11MCDisassembler \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11LTO \
  libLLVM11Support \
  libLLVM11ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
