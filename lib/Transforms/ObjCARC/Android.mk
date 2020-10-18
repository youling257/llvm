LOCAL_PATH:= $(call my-dir)

transforms_objcarc_SRC_FILES := \
  ObjCARC.cpp \
  ObjCARCOpts.cpp \
  ObjCARCExpand.cpp \
  ObjCARCAPElim.cpp \
  ObjCARCContract.cpp \
  DependencyAnalysis.cpp \
  ProvenanceAnalysis.cpp \
  ProvenanceAnalysisEvaluator.cpp \
  PtrState.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_objcarc_SRC_FILES)
LOCAL_MODULE:= libLLVM11TransformObjCARC

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_objcarc_SRC_FILES)
LOCAL_MODULE:= libLLVM11TransformObjCARC

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
