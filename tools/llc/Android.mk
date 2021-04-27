LOCAL_PATH := $(call my-dir)

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM12MipsAsmParser \
  libLLVM12MipsInfo \
  libLLVM12MipsCodeGen \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM12X86Info \
  libLLVM12X86AsmParser \
  libLLVM12X86CodeGen \
  libLLVM12X86Disassembler \
  libLLVM12X86Desc \
  libLLVM12X86AsmPrinter \
  libLLVM12X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM12ARMCodeGen \
  libLLVM12ARMDisassembler \
  libLLVM12ARMAsmParser \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMDesc \
  libLLVM12ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM12AsmPrinter \
  libLLVM12IRReader \
  libLLVM12AsmParser \
  libLLVM12BitReader \
  libLLVM12BitWriter \
  libLLVM12SelectionDAG \
  libLLVM12InstCombine \
  libLLVM12CodeGen \
  libLLVM12Instrumentation \
  libLLVM12Object \
  libLLVM12ipo \
  libLLVM12Linker \
  libLLVM12MCDisassembler \
  libLLVM12MC \
  libLLVM12MIRParser \
  libLLVM12MCParser \
  libLLVM12ScalarOpts \
  libLLVM12TransformUtils \
  libLLVM12Vectorize \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12Core \
  libLLVM12Support \
  libLLVM12Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM12AArch64Info \
  libLLVM12AArch64AsmParser \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Disassembler \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmPrinter \
  libLLVM12AArch64Utils



#===---------------------------------------------------------------===
# llc command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)

LOCAL_STATIC_LIBRARIES := \
  $(llvm_llc_arm_STATIC_LIBRARIES) \
  $(llvm_llc_mips_STATIC_LIBRARIES) \
  $(llvm_llc_x86_STATIC_LIBRARIES) \
  $(llvm_llc_aarch64_STATIC_LIBRARIES) \
  $(llvm_llc_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM12_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llc build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := $(llvm_llc_SRC_FILES)
LOCAL_C_INCLUDES += external/llvm/include

LOCAL_STATIC_LIBRARIES_arm += $(llvm_llc_arm_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_mips64 += $(llvm_llc_mips_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_x86_64 += $(llvm_llc_x86_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_aarch64_STATIC_LIBRARIES)
LOCAL_STATIC_LIBRARIES_arm64 += $(llvm_llc_arm_STATIC_LIBRARIES)

LOCAL_STATIC_LIBRARIES += $(llvm_llc_STATIC_LIBRARIES)

include $(LLVM12_ROOT_PATH)/llvm.mk
include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
