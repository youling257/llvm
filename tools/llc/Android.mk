LOCAL_PATH := $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llc command line tool (common)
#===---------------------------------------------------------------===

llvm_llc_SRC_FILES := \
  llc.cpp

llvm_llc_mips_STATIC_LIBRARIES := \
  libLLVM11MipsAsmParser \
  libLLVM11MipsInfo \
  libLLVM11MipsCodeGen \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmPrinter \

llvm_llc_x86_STATIC_LIBRARIES := \
  libLLVM11X86Info \
  libLLVM11X86AsmParser \
  libLLVM11X86CodeGen \
  libLLVM11X86Disassembler \
  libLLVM11X86Desc \
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils

llvm_llc_arm_STATIC_LIBRARIES := \
  libLLVM11ARMCodeGen \
  libLLVM11ARMDisassembler \
  libLLVM11ARMAsmParser \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMDesc \
  libLLVM11ARMInfo

llvm_llc_STATIC_LIBRARIES := \
  libLLVM11AsmPrinter \
  libLLVM11IRReader \
  libLLVM11AsmParser \
  libLLVM11BitReader \
  libLLVM11BitWriter \
  libLLVM11SelectionDAG \
  libLLVM11InstCombine \
  libLLVM11CodeGen \
  libLLVM11Instrumentation \
  libLLVM11Object \
  libLLVM11ipo \
  libLLVM11Linker \
  libLLVM11MCDisassembler \
  libLLVM11MC \
  libLLVM11MIRParser \
  libLLVM11MCParser \
  libLLVM11ScalarOpts \
  libLLVM11TransformUtils \
  libLLVM11Vectorize \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11Core \
  libLLVM11Support \
  libLLVM11Object

llvm_llc_aarch64_STATIC_LIBRARIES := \
  libLLVM11AArch64Info \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Disassembler \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Utils



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

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)


#===---------------------------------------------------------------===
# llc command line tool (target)
#===---------------------------------------------------------------===

ifeq (,$(filter $(TARGET_ARCH),$(LLVM11_SUPPORTED_ARCH)))
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

include $(LLVM11_ROOT_PATH)/llvm.mk
include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_EXECUTABLE)
endif
