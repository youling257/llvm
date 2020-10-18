LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# lli command line tool
#===---------------------------------------------------------------===

lli_SRC_FILES := \
  lli.cpp \
  OrcLazyJIT.cpp \
  RemoteMemoryManager.cpp \
  RemoteTarget.cpp \
  RemoteTargetExternal.cpp \

lli_STATIC_LIBRARIES := \
  libLLVM11IRReader \
  libLLVM11BitReader \
  libLLVM11ARMCodeGen \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMAsmParser \
  libLLVM11ARMDisassembler \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64AsmParser \
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
  libLLVM11CodeGen \
  libLLVM11Instrumentation \
  libLLVM11Linker \
  libLLVM11Interpreter \
  libLLVM11ScalarOpts \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11MC \
  libLLVM11MCJIT \
  libLLVM11OrcJIT \
  libLLVM11ExecutionEngine \
  libLLVM11RuntimeDyld \
  libLLVM11MCParser \
  libLLVM11Object \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11Support \
  libLLVM11MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := lli
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(lli_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(lli_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
