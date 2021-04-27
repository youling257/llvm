LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# opt command line tool
#===---------------------------------------------------------------===

llvm_opt_SRC_FILES := \
  AnalysisWrappers.cpp \
  BreakpointPrinter.cpp \
  GraphPrinters.cpp \
  NewPMDriver.cpp \
  PassPrinters.cpp \
  PrintSCC.cpp \
  opt.cpp \

llvm_opt_STATIC_LIBRARIES := \
  libLLVM12IRReader \
  libLLVM12BitReader \
  libLLVM12BitWriter \
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
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12Object \
  libLLVM12ProfileData \
  libLLVM12Core \
  libLLVM12AsmParser \
  libLLVM12Option \
  libLLVM12Support \
  libLLVM12MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread -ldl
LOCAL_LDFLAGS_darwin := -Wl,-export_dynamic
LOCAL_LDFLAGS_linux := -Wl,--export-dynamic

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := opt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_opt_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_opt_STATIC_LIBRARIES)

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
