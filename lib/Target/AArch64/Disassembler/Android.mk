LOCAL_PATH := $(call my-dir)

aarch64_disassembler_TBLGEN_TABLES12 := \
  AArch64GenDisassemblerTables.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenSystemOperands.inc

aarch64_disassembler_SRC_FILES := \
  AArch64Disassembler.cpp \
  AArch64ExternalSymbolizer.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

TBLGEN_TABLES12 := $(aarch64_disassembler_TBLGEN_TABLES12)

TBLGEN_TD_DIR12 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM12AArch64Disassembler

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

TBLGEN_TABLES12 := $(aarch64_disassembler_TBLGEN_TABLES12)

TBLGEN_TD_DIR12 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(aarch64_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM12AArch64Disassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

