LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-lto command line tool
#===---------------------------------------------------------------===

llvm_lto_SRC_FILES := \
  llvm-lto.cpp

llvm_lto_STATIC_LIBRARIES := \
  libLLVM11ARMCodeGen \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMAsmParser \
  libLLVM11ARMDisassembler \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Desc \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler \
  libLLVM11MipsCodeGen \
  libLLVM11MipsInfo \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmPrinter \
  libLLVM11MipsAsmParser \
  libLLVM11MipsDisassembler \
  libLLVM11X86CodeGen \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmPrinter \
  libLLVM11X86AsmParser \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11AsmPrinter \
  libLLVM11SelectionDAG \
  libLLVM11LTO \
  libLLVM11CodeGen \
  libLLVM11Target \
  libLLVM11BitReader \
  libLLVM11BitWriter \
  libLLVM11Linker \
  libLLVM11ipo \
  libLLVM11IRReader \
  libLLVM11TransformObjCARC \
  libLLVM11ScalarOpts \
  libLLVM11InstCombine \
  libLLVM11Vectorize \
  libLLVM11Instrumentation \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11MCDisassembler \
  libLLVM11Object \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-lto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
