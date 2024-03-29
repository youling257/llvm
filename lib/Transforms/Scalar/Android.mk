LOCAL_PATH:= $(call my-dir)

transforms_scalar_SRC_FILES := \
  ADCE.cpp \
  AlignmentFromAssumptions.cpp \
  AnnotationRemarks.cpp \
  BDCE.cpp \
  CallSiteSplitting.cpp \
  ConstantHoisting.cpp \
  ConstraintElimination.cpp \
  CorrelatedValuePropagation.cpp \
  DCE.cpp \
  DeadStoreElimination.cpp \
  DivRemPairs.cpp \
  EarlyCSE.cpp \
  FlattenCFGPass.cpp \
  Float2Int.cpp \
  GuardWidening.cpp \
  GVN.cpp \
  GVNHoist.cpp \
  GVNSink.cpp \
  IVUsersPrinter.cpp \
  InductiveRangeCheckElimination.cpp \
  IndVarSimplify.cpp \
  InferAddressSpaces.cpp \
  InstSimplifyPass.cpp \
  JumpThreading.cpp \
  LICM.cpp \
  LoopAccessAnalysisPrinter.cpp \
  LoopSink.cpp \
  LoopDeletion.cpp \
  LoopDataPrefetch.cpp \
  LoopDistribute.cpp \
  LoopFuse.cpp \
  LoopIdiomRecognize.cpp \
  LoopInstSimplify.cpp \
  LoopInterchange.cpp \
  LoopFlatten.cpp \
  LoopLoadElimination.cpp \
  LoopPassManager.cpp \
  LoopPredication.cpp \
  LoopRerollPass.cpp \
  LoopRotation.cpp \
  LoopSimplifyCFG.cpp \
  LoopStrengthReduce.cpp \
  LoopUnrollPass.cpp \
  LoopUnrollAndJamPass.cpp \
  LoopUnswitch.cpp \
  LoopVersioningLICM.cpp \
  LowerAtomic.cpp \
  LowerConstantIntrinsics.cpp \
  LowerExpectIntrinsic.cpp \
  LowerGuardIntrinsic.cpp \
  LowerMatrixIntrinsics.cpp \
  LowerWidenableCondition.cpp \
  MakeGuardsExplicit.cpp \
  MemCpyOptimizer.cpp \
  MergeICmps.cpp \
  MergedLoadStoreMotion.cpp \
  NaryReassociate.cpp \
  NewGVN.cpp \
  PartiallyInlineLibCalls.cpp \
  PlaceSafepoints.cpp \
  Reassociate.cpp \
  Reg2Mem.cpp \
  RewriteStatepointsForGC.cpp \
  SCCP.cpp \
  SROA.cpp \
  Scalar.cpp \
  Scalarizer.cpp \
  ScalarizeMaskedMemIntrin.cpp \
  SeparateConstOffsetFromGEP.cpp \
  SimpleLoopUnswitch.cpp \
  SimplifyCFGPass.cpp \
  Sink.cpp \
  SpeculativeExecution.cpp \
  SpeculateAroundPHIs.cpp \
  StraightLineStrengthReduce.cpp \
  StructurizeCFG.cpp \
  TailRecursionElimination.cpp \
  WarnMissedTransforms.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES :=	\
	$(transforms_scalar_SRC_FILES)

LOCAL_MODULE:= libLLVM12ScalarOpts

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_scalar_SRC_FILES)
LOCAL_MODULE:= libLLVM12ScalarOpts

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
