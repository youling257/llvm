LOCAL_PATH:= $(call my-dir)

transforms_utils_SRC_FILES := \
  AddDiscriminators.cpp \
  AMDGPUEmitPrintf.cpp \
  ASanStackFrameLayout.cpp \
  AssumeBundleBuilder.cpp \
  BasicBlockUtils.cpp \
  BreakCriticalEdges.cpp \
  BuildLibCalls.cpp \
  BypassSlowDivision.cpp \
  CallPromotionUtils.cpp \
  CallGraphUpdater.cpp \
  CanonicalizeAliases.cpp \
  CanonicalizeFreezeInLoops.cpp \
  CloneFunction.cpp \
  CloneModule.cpp \
  CodeExtractor.cpp \
  CodeMoverUtils.cpp \
  CtorUtils.cpp \
  Debugify.cpp \
  DemoteRegToStack.cpp \
  EntryExitInstrumenter.cpp \
  EscapeEnumerator.cpp \
  Evaluator.cpp \
  FixIrreducible.cpp \
  FlattenCFG.cpp \
  FunctionComparator.cpp \
  FunctionImportUtils.cpp \
  GlobalStatus.cpp \
  GuardUtils.cpp \
  InlineFunction.cpp \
  InjectTLIMappings.cpp \
  InstructionNamer.cpp \
  IntegerDivision.cpp \
  LCSSA.cpp \
  LibCallsShrinkWrap.cpp \
  Local.cpp \
  LoopPeel.cpp \
  LoopRotationUtils.cpp \
  LoopSimplify.cpp \
  LoopUnroll.cpp \
  LoopUnrollAndJam.cpp \
  LoopUnrollRuntime.cpp \
  LoopUtils.cpp \
  LoopVersioning.cpp \
  LowerInvoke.cpp \
  LowerMemIntrinsics.cpp \
  LowerSwitch.cpp \
  MatrixUtils.cpp \
  Mem2Reg.cpp \
  MetaRenamer.cpp \
  ModuleUtils.cpp \
  NameAnonGlobals.cpp \
  PredicateInfo.cpp \
  PromoteMemoryToRegister.cpp \
  ScalarEvolutionExpander.cpp \
  StripGCRelocates.cpp \
  SSAUpdater.cpp \
  SSAUpdaterBulk.cpp \
  SanitizerStats.cpp \
  SimplifyCFG.cpp \
  SimplifyIndVar.cpp \
  SimplifyLibCalls.cpp \
  SizeOpts.cpp \
  SplitModule.cpp \
  StripNonLineTableDebugInfo.cpp \
  SymbolRewriter.cpp \
  UnifyFunctionExitNodes.cpp \
  UnifyLoopExits.cpp \
  UniqueInternalLinkageNames.cpp \
  Utils.cpp \
  ValueMapper.cpp \
  VNCoercion.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= libLLVM12TransformUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= libLLVM12TransformUtils

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
