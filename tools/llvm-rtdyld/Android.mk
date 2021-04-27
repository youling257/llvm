LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-rtdyld command line tool
#===---------------------------------------------------------------===

llvm_rtdyld_SRC_FILES := \
  llvm-rtdyld.cpp

llvm_rtdyld_STATIC_LIBRARIES := \
  libLLVM12ARMCodeGen \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMAsmParser \
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
  libLLVM12MipsDesc \
  libLLVM12MipsAsmPrinter \
  libLLVM12MipsAsmParser \
  libLLVM12MipsDisassembler \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmPrinter \
  libLLVM12X86AsmParser \
  libLLVM12X86Utils \
  libLLVM12X86Disassembler \
  libLLVM12DebugInfoDWARF \
  libLLVM12DebugInfoPDB \
  libLLVM12ExecutionEngine    \
  libLLVM12CodeGen \
  libLLVM12Object             \
  libLLVM12MC                 \
  libLLVM12MCParser           \
  libLLVM12RuntimeDyld        \
  libLLVM12BitReader          \
  libLLVM12Core               \
  libLLVM12Support            \
  libLLVM12MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-rtdyld
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_rtdyld_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_rtdyld_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
