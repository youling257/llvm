LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-mc command line tool
#===---------------------------------------------------------------===

llvm_mc_SRC_FILES := \
  llvm-mc.cpp \
  Disassembler.cpp

llvm_mc_STATIC_LIBRARIES := \
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
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11X86CodeGen \
  libLLVM11AsmPrinter \
  libLLVM11CodeGen \
  libLLVM11TransformUtils \
  libLLVM11Target \
  libLLVM11Analysis \
  libLLVM11MC \
  libLLVM11Object \
  libLLVM11BitReader \
  libLLVM11MCParser \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Support \
  libLLVM11MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-mc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_mc_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_mc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
