LOCAL_PATH:= $(call my-dir)

transforms_inst_combine_SRC_FILES := \
  InstructionCombining.cpp \
  InstCombineAddSub.cpp \
  InstCombineAndOrXor.cpp \
  InstCombineAtomicRMW.cpp \
  InstCombineCalls.cpp \
  InstCombineCasts.cpp \
  InstCombineCompares.cpp \
  InstCombineLoadStoreAlloca.cpp \
  InstCombineMulDivRem.cpp \
  InstCombineNegator.cpp \
  InstCombinePHI.cpp \
  InstCombineSelect.cpp \
  InstCombineShifts.cpp \
  InstCombineSimplifyDemanded.cpp \
  InstCombineVectorOps.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

TBLGEN_TABLES12 := $(transforms_inst_combine_TBLGEN_TABLES12)
LOCAL_SRC_FILES := $(transforms_inst_combine_SRC_FILES)
LOCAL_MODULE:= libLLVM12InstCombine

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

TBLGEN_TABLES12 := $(transforms_inst_combine_TBLGEN_TABLES12)
LOCAL_SRC_FILES := $(transforms_inst_combine_SRC_FILES)
LOCAL_MODULE:= libLLVM12InstCombine

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
