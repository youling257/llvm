LOCAL_PATH:= $(call my-dir)

orcjit_SRC_FILES := \
  CompileOnDemandLayer.cpp \
  CompileUtils.cpp \
  Core.cpp \
  DebugUtils.cpp \
  ExecutionUtils.cpp \
  IndirectionUtils.cpp \
  IRCompileLayer.cpp \
  IRTransformLayer.cpp \
  JITTargetMachineBuilder.cpp \
  LazyReexports.cpp \
  Layer.cpp \
  LLJIT.cpp \
  MachOPlatform.cpp \
  Mangling.cpp \
  ObjectLinkingLayer.cpp \
  ObjectTransformLayer.cpp \
  OrcABISupport.cpp \
  OrcV2CBindings.cpp \
  RTDyldObjectLinkingLayer.cpp \
  Speculation.cpp \
  SpeculateAnalyses.cpp \
  TargetProcessControl.cpp \
  ThreadSafeModule.cpp \
  TPCDynamicLibrarySearchGenerator.cpp \
  TPCEHFrameRegistrar.cpp \
  TPCIndirectionUtils.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM12OrcJIT

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(orcjit_SRC_FILES)
LOCAL_MODULE := libLLVM12OrcJIT

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
