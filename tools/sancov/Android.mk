LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# sancov command line tool
#===---------------------------------------------------------------===

llvm_sancov_SRC_FILES := \
  sancov.cc \

llvm_sancov_STATIC_LIBRARIES := \
  libLLVM12IRReader \
  libLLVM12ARMCodeGen \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMDisassembler \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Info \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmPrinter \
  libLLVM12AArch64Utils \
  libLLVM12AArch64Disassembler \
  libLLVM12MipsCodeGen \
  libLLVM12MipsInfo \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmPrinter \
  libLLVM12MipsDisassembler \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmPrinter \
  libLLVM12X86Utils \
  libLLVM12X86Disassembler \
  libLLVM12Symbolize \
  libLLVM12DebugInfoDWARF \
  libLLVM12DebugInfoPDB \
  libLLVM12AsmPrinter \
  libLLVM12SelectionDAG \
  libLLVM12CodeGen \
  libLLVM12TransformObjCARC \
  libLLVM12Vectorize \
  libLLVM12ScalarOpts \
  libLLVM12Passes \
  libLLVM12ipo \
  libLLVM12Linker \
  libLLVM12InstCombine \
  libLLVM12Instrumentation \
  libLLVM12TransformUtils \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12Object \
  libLLVM12BitReader \
  libLLVM12BitWriter \
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12ProfileData \
  libLLVM12Core \
  libLLVM12AsmParser \
  libLLVM12Option \
  libLLVM12Support \
  libLLVM12MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := sancov

LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := $(llvm_sancov_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_sancov_STATIC_LIBRARIES)

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
