LOCAL_PATH := $(call my-dir)

arm_asm_printer_TBLGEN_TABLES70 := \
  ARMGenAsmWriter.inc \
  ARMGenRegisterInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenInstrInfo.inc

arm_asm_printer_SRC_FILES := \
  ARMInstPrinter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

TBLGEN_TABLES70 := $(arm_asm_printer_TBLGEN_TABLES70)

TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES)

LOCAL_MODULE:= libLLVM70ARMAsmPrinter

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/..

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

TBLGEN_TABLES70 := $(arm_asm_printer_TBLGEN_TABLES70)

TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_asm_printer_SRC_FILES)

LOCAL_C_INCLUDES+= \
    $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM70ARMAsmPrinter

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

