LOCAL_PATH := $(call my-dir)

mips_disassembler_TBLGEN_TABLES12 := \
  MipsGenDisassemblerTables.inc \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_disassembler_SRC_FILES := \
  MipsDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

LOCAL_MODULE:= libLLVM12MipsDisassembler

LOCAL_SRC_FILES := $(mips_disassembler_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES12 := $(mips_disassembler_TBLGEN_TABLES12)
TBLGEN_TD_DIR12 := $(LOCAL_PATH)/..

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

LOCAL_MODULE:= libLLVM12MipsDisassembler
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(mips_disassembler_SRC_FILES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

TBLGEN_TABLES12 := $(mips_disassembler_TBLGEN_TABLES12)
TBLGEN_TD_DIR12 := $(LOCAL_PATH)/..

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
