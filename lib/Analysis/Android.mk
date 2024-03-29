LOCAL_PATH:= $(call my-dir)

analysis_SRC_FILES := \
  AliasAnalysis.cpp \
  AliasAnalysisEvaluator.cpp \
  AliasAnalysisSummary.cpp \
  AliasSetTracker.cpp \
  Analysis.cpp \
  AssumeBundleQueries.cpp \
  AssumptionCache.cpp \
  BasicAliasAnalysis.cpp \
  BlockFrequencyInfo.cpp \
  BlockFrequencyInfoImpl.cpp \
  BranchProbabilityInfo.cpp \
  CFG.cpp \
  CFGPrinter.cpp \
  CFLAndersAliasAnalysis.cpp \
  CFLSteensAliasAnalysis.cpp \
  CGSCCPassManager.cpp \
  CallGraph.cpp \
  CallGraphSCCPass.cpp \
  CallPrinter.cpp \
  CaptureTracking.cpp \
  CmpInstAnalysis.cpp \
  CostModel.cpp \
  CodeMetrics.cpp \
  ConstantFolding.cpp \
  DDG.cpp \
  DDGPrinter.cpp \
  ConstraintSystem.cpp \
  Delinearization.cpp \
  DemandedBits.cpp \
  DependenceAnalysis.cpp \
  DependenceGraphBuilder.cpp \
  DevelopmentModeInlineAdvisor.cpp \
  DivergenceAnalysis.cpp \
  DomPrinter.cpp \
  DomTreeUpdater.cpp \
  DominanceFrontier.cpp \
  EHPersonalities.cpp \
  FunctionPropertiesAnalysis.cpp \
  GlobalsModRef.cpp \
  GuardUtils.cpp \
  HeatUtils.cpp \
  IRSimilarityIdentifier.cpp \
  IVDescriptors.cpp \
  IVUsers.cpp \
  ImportedFunctionsInliningStatistics.cpp \
  IndirectCallPromotionAnalysis.cpp \
  InlineCost.cpp \
  InlineAdvisor.cpp \
  InlineSizeEstimatorAnalysis.cpp \
  InstCount.cpp \
  InstructionPrecedenceTracking.cpp \
  InstructionSimplify.cpp \
  Interval.cpp \
  IntervalPartition.cpp \
  LazyBranchProbabilityInfo.cpp \
  LazyBlockFrequencyInfo.cpp \
  LazyCallGraph.cpp \
  LazyValueInfo.cpp \
  LegacyDivergenceAnalysis.cpp \
  Lint.cpp \
  Loads.cpp \
  LoopAccessAnalysis.cpp \
  LoopAnalysisManager.cpp \
  LoopCacheAnalysis.cpp \
  LoopNestAnalysis.cpp \
  LoopUnrollAnalyzer.cpp \
  LoopInfo.cpp \
  LoopPass.cpp \
  MLInlineAdvisor.cpp \
  MemDepPrinter.cpp \
  MemDerefPrinter.cpp \
  MemoryBuiltins.cpp \
  MemoryDependenceAnalysis.cpp \
  MemoryLocation.cpp \
  MemorySSA.cpp \
  MemorySSAUpdater.cpp \
  ModuleDebugInfoPrinter.cpp \
  ModuleSummaryAnalysis.cpp \
  MustExecute.cpp \
  ObjCARCAliasAnalysis.cpp \
  ObjCARCAnalysisUtils.cpp \
  ObjCARCInstKind.cpp \
  OptimizationRemarkEmitter.cpp \
  PHITransAddr.cpp \
  PhiValues.cpp \
  PostDominators.cpp \
  ProfileSummaryInfo.cpp \
  PtrUseVisitor.cpp \
  RegionInfo.cpp \
  RegionPass.cpp \
  RegionPrinter.cpp \
  ReleaseModeModelRunner.cpp \
  ReplayInlineAdvisor.cpp \
  ScalarEvolution.cpp \
  ScalarEvolutionAliasAnalysis.cpp \
  ScalarEvolutionDivision.cpp \
  ScalarEvolutionNormalization.cpp \
  StackLifetime.cpp \
  StackSafetyAnalysis.cpp \
  SyncDependenceAnalysis.cpp \
  SyntheticCountsUtils.cpp \
  TFUtils.cpp \
  TargetLibraryInfo.cpp \
  TargetTransformInfo.cpp \
  Trace.cpp \
  TypeBasedAliasAnalysis.cpp \
  TypeMetadataUtils.cpp \
  ScopedNoAliasAA.cpp \
  ValueLattice.cpp \
  ValueLatticeUtils.cpp \
  ValueTracking.cpp \
  VectorUtils.cpp \
  VFABIDemangling.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM12Analysis
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(analysis_SRC_FILES)

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM12Analysis
LOCAL_SRC_FILES := $(analysis_SRC_FILES)

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
