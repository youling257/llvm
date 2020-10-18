LOCAL_PATH := $(call my-dir)

amdgpu_target_info_TBLGEN_TABLES11 := \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenIntrinsicEnums.inc \
  AMDGPUGenIntrinsicImpl.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  R600GenInstrInfo.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_target_info_SRC_FILES := \
  AMDGPUTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE := libLLVM11AMDGPUInfo
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES11 := $(amdgpu_target_info_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(amdgpu_target_info_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE := libLLVM11AMDGPUInfo

TBLGEN_TABLES11 := $(amdgpu_target_info_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(amdgpu_target_info_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
