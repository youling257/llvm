LOCAL_PATH := $(call my-dir)

arm_mc_desc_TBLGEN_TABLES11 := \
  ARMGenAsmWriter.inc \
  ARMGenRegisterInfo.inc \
  ARMGenInstrInfo.inc \
  ARMGenMCCodeEmitter.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenSystemRegister.inc

arm_mc_desc_SRC_FILES := \
  ARMAsmBackend.cpp \
  ARMELFObjectWriter.cpp \
  ARMELFStreamer.cpp \
  ARMInstPrinter.cpp \
  ARMMachObjectWriter.cpp \
  ARMMachORelocationInfo.cpp \
  ARMMCAsmInfo.cpp \
  ARMMCCodeEmitter.cpp \
  ARMMCExpr.cpp \
  ARMMCTargetDesc.cpp \
  ARMTargetStreamer.cpp \
  ARMUnwindOpAsm.cpp \
  ARMWinCOFFObjectWriter.cpp \
  ARMWinCOFFStreamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)


LOCAL_MODULE:= libLLVM11ARMDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(arm_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..
TBLGEN_TABLES11 := $(arm_mc_desc_TBLGEN_TABLES11)

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE:= libLLVM11ARMDesc
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(arm_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..
TBLGEN_TABLES11 := $(arm_mc_desc_TBLGEN_TABLES11)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
