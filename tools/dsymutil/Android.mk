LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM12_ROOT_PATH)/llvm.mk

llvm_dsymutil_SRC_FILES := \
  BinaryHolder.cpp \
  DebugMap.cpp \
  dsymutil.cpp \
  DwarfLinker.cpp \
  MachODebugMapParser.cpp \
  MachOUtils.cpp \

llvm_dsymutil_STATIC_LIBRARIES := \
  libLLVM12ARMCodeGen \
  libLLVM12ARMAsmParser \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMDisassembler \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Info \
  libLLVM12AArch64AsmParser \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmPrinter \
  libLLVM12AArch64Utils \
  libLLVM12AArch64Disassembler \
  libLLVM12MipsCodeGen \
  libLLVM12MipsInfo \
  libLLVM12MipsAsmParser \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmPrinter \
  libLLVM12MipsDisassembler \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmParser \
  libLLVM12X86AsmPrinter \
  libLLVM12X86Utils \
  libLLVM12X86Disassembler \
  libLLVM12X86CodeGen \
  libLLVM12AsmPrinter \
  libLLVM12SelectionDAG \
  libLLVM12CodeGen \
  libLLVM12DebugInfoDWARF \
  libLLVM12Instrumentation \
  libLLVM12MCParser \
  libLLVM12MCDisassembler \
  libLLVM12Object \
  libLLVM12BitReader \
  libLLVM12ScalarOpts \
  libLLVM12TransformUtils \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12Core \
  libLLVM12MC \
  libLLVM12Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-dsymutil
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_dsymutil_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_dsymutil_STATIC_LIBRARIES)

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
