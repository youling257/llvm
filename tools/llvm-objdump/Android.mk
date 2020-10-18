LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-objdump command line tool
#===---------------------------------------------------------------===

llvm_objdump_SRC_FILES := \
  llvm-objdump.cpp \
  COFFDump.cpp \
  ELFDump.cpp \
  MachODump.cpp \

llvm_objdump_STATIC_LIBRARIES := \
  libLLVM11DebugInfoDWARF \
  libLLVM11DebugInfoPDB \
  libLLVM11ARMAsmParser \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMDisassembler \
  libLLVM11AArch64Info \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler \
  libLLVM11MipsInfo \
  libLLVM11MipsAsmParser \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmPrinter \
  libLLVM11MipsDisassembler \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmParser \
  libLLVM11X86CodeGen \
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11AsmPrinter \
  libLLVM11CodeGen \
  libLLVM11TransformUtils \
  libLLVM11Target \
  libLLVM11Analysis \
  libLLVM11Object \
  libLLVM11MCParser \
  libLLVM11MC \
  libLLVM11MCDisassembler \
  libLLVM11BitReader \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-objdump
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_objdump_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_objdump_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
