LOCAL_PATH := $(call my-dir)

LLVM80_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM80_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM80ARMCodeGen \
  libLLVM80ARMAsmParser \
  libLLVM80ARMInfo \
  libLLVM80ARMDesc \
  libLLVM80ARMAsmPrinter \
  libLLVM80ARMDisassembler \
  libLLVM80AArch64CodeGen \
  libLLVM80AArch64Info \
  libLLVM80AArch64AsmParser \
  libLLVM80AArch64Desc \
  libLLVM80AArch64AsmPrinter \
  libLLVM80AArch64Utils \
  libLLVM80AArch64Disassembler \
  libLLVM80MipsCodeGen \
  libLLVM80MipsInfo \
  libLLVM80MipsAsmParser \
  libLLVM80MipsDesc \
  libLLVM80MipsAsmPrinter \
  libLLVM80MipsDisassembler \
  libLLVM80X86CodeGen \
  libLLVM80X86Info \
  libLLVM80X86Desc \
  libLLVM80X86AsmParser \
  libLLVM80X86AsmPrinter \
  libLLVM80X86Utils \
  libLLVM80X86Disassembler \
  libLLVM80X86CodeGen \
  libLLVM80AsmPrinter \
  libLLVM80SelectionDAG \
  libLLVM80CodeGen \
  libLLVM80DebugInfoDWARF \
  libLLVM80Instrumentation \
  libLLVM80MCParser \
  libLLVM80MCDisassembler \
  libLLVM80Object \
  libLLVM80BitReader \
  libLLVM80ScalarOpts \
  libLLVM80TransformUtils \
  libLLVM80Analysis \
  libLLVM80Target \
  libLLVM80Core \
  libLLVM80MC \
  libLLVM80Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM80_HOST_BUILD_MK)
include $(LLVM80_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
