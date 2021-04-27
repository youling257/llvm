LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-dwp command line tool
#===---------------------------------------------------------------===

llvm_dwp_SRC_FILES := \
  llvm-dwp.cpp

llvm_dwp_STATIC_LIBRARIES := \
  libLLVM12DebugInfoDWARF \
  libLLVM12Object \
  libLLVM12BitReader \
  libLLVM12ARMCodeGen \
  libLLVM12ARMAsmParser \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMDisassembler \
  libLLVM12MipsCodeGen \
  libLLVM12MipsInfo \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmParser \
  libLLVM12MipsAsmPrinter \
  libLLVM12MipsDisassembler \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmParser \
  libLLVM12X86AsmPrinter \
  libLLVM12X86Utils \
  libLLVM12X86Disassembler \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Info \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmParser \
  libLLVM12AArch64AsmPrinter \
  libLLVM12AArch64Utils \
  libLLVM12AArch64Disassembler \
  libLLVM12ExecutionEngine \
  libLLVM12RuntimeDyld \
  libLLVM12MCJIT \
  libLLVM12OrcJIT \
  libLLVM12AsmPrinter \
  libLLVM12SelectionDAG \
  libLLVM12CodeGen \
  libLLVM12Object \
  libLLVM12ScalarOpts \
  libLLVM12InstCombine \
  libLLVM12Instrumentation \
  libLLVM12TransformObjCARC \
  libLLVM12TransformUtils \
  libLLVM12Vectorize \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12MCDisassembler \
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12Core \
  libLLVM12AsmParser \
  libLLVM12Option \
  libLLVM12LTO \
  libLLVM12Support \
  libLLVM12ProfileData

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dwp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_dwp_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_dwp_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
