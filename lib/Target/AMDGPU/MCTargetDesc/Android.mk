LOCAL_PATH := $(call my-dir)

amdgpu_mc_desc_TBLGEN_TABLES11 := \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  R600GenAsmWriter.inc \
  R600GenMCCodeEmitter.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_mc_desc_SRC_FILES := \
  AMDGPUAsmBackend.cpp \
  AMDGPUELFObjectWriter.cpp \
  AMDGPUELFStreamer.cpp \
  AMDGPUInstPrinter.cpp \
  AMDGPUMCAsmInfo.cpp \
  AMDGPUMCCodeEmitter.cpp \
  AMDGPUMCTargetDesc.cpp \
  AMDGPUTargetStreamer.cpp \
  R600MCCodeEmitter.cpp \
  R600MCTargetDesc.cpp \
  SIMCCodeEmitter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE := libLLVM11AMDGPUDesc
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..
TBLGEN_TABLES11 := $(amdgpu_mc_desc_TBLGEN_TABLES11)

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

LOCAL_MODULE := libLLVM11AMDGPUDesc

LOCAL_SRC_FILES := $(amdgpu_mc_desc_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..
TBLGEN_TABLES11 := $(amdgpu_mc_desc_TBLGEN_TABLES11)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
