LOCAL_PATH := $(call my-dir)

amdgpu_codegen_TBLGEN_TABLES12 := \
  AMDGPUGenAsmMatcher.inc \
  AMDGPUGenAsmWriter.inc \
  AMDGPUGenCallingConv.inc \
  AMDGPUGenDAGISel.inc \
  AMDGPUGenDisassemblerTables.inc \
  AMDGPUGenInstrInfo.inc \
  AMDGPUGenMCCodeEmitter.inc \
  AMDGPUGenMCPseudoLowering.inc \
  AMDGPUGenRegisterBank.inc \
  AMDGPUGenRegisterInfo.inc \
  AMDGPUGenSearchableTables.inc \
  AMDGPUGenSubtargetInfo.inc \
  AMDGPUGenGlobalISel.inc \
  AMDGPUGenPreLegalizeGICombiner.inc \
  AMDGPUGenPostLegalizeGICombiner.inc \
  AMDGPUGenRegBankGICombiner.inc \
  R600GenAsmWriter.inc \
  R600GenCallingConv.inc \
  R600GenDAGISel.inc \
  R600GenDFAPacketizer.inc \
  R600GenInstrInfo.inc \
  R600GenMCCodeEmitter.inc \
  R600GenRegisterInfo.inc \
  R600GenSubtargetInfo.inc

amdgpu_codegen_SRC_FILES := \
  AMDGPUAliasAnalysis.cpp \
  AMDGPUAlwaysInlinePass.cpp \
  AMDGPUAnnotateKernelFeatures.cpp \
  AMDGPUAnnotateUniformValues.cpp \
  AMDGPUArgumentUsageInfo.cpp \
  AMDGPUAsmPrinter.cpp \
  AMDGPUAtomicOptimizer.cpp \
  AMDGPUCallLowering.cpp \
  AMDGPUCodeGenPrepare.cpp \
  AMDGPUExportClustering.cpp \
  AMDGPUFixFunctionBitcasts.cpp \
  AMDGPUFrameLowering.cpp \
  AMDGPUHSAMetadataStreamer.cpp \
  AMDGPUInstCombineIntrinsic.cpp \
  AMDGPUInstrInfo.cpp \
  AMDGPUInstructionSelector.cpp \
  AMDGPUISelDAGToDAG.cpp \
  AMDGPUISelLowering.cpp \
  AMDGPUGlobalISelUtils.cpp \
  AMDGPULateCodeGenPrepare.cpp \
  AMDGPULegalizerInfo.cpp \
  AMDGPULibCalls.cpp \
  AMDGPULibFunc.cpp \
  AMDGPULowerIntrinsics.cpp \
  AMDGPULowerKernelArguments.cpp \
  AMDGPULowerKernelAttributes.cpp \
  AMDGPUMachineCFGStructurizer.cpp \
  AMDGPUMachineFunction.cpp \
  AMDGPUMachineModuleInfo.cpp \
  AMDGPUMacroFusion.cpp \
  AMDGPUMCInstLower.cpp \
  AMDGPUMIRFormatter.cpp \
  AMDGPUOpenCLEnqueuedBlockLowering.cpp \
  AMDGPUPostLegalizerCombiner.cpp \
  AMDGPUPreLegalizerCombiner.cpp \
  AMDGPUPromoteAlloca.cpp \
  AMDGPUPropagateAttributes.cpp \
  AMDGPURegBankCombiner.cpp \
  AMDGPURegisterBankInfo.cpp \
  AMDGPURewriteOutArguments.cpp \
  AMDGPUSubtarget.cpp \
  AMDGPUTargetMachine.cpp \
  AMDGPUTargetObjectFile.cpp \
  AMDGPUTargetTransformInfo.cpp \
  AMDGPUUnifyDivergentExitNodes.cpp \
  AMDGPUUnifyMetadata.cpp \
  AMDGPUPerfHintAnalysis.cpp \
  AMDILCFGStructurizer.cpp \
  AMDGPUPrintfRuntimeBinding.cpp \
  GCNHazardRecognizer.cpp \
  GCNIterativeScheduler.cpp \
  GCNMinRegStrategy.cpp \
  GCNRegPressure.cpp \
  GCNSchedStrategy.cpp \
  R600AsmPrinter.cpp \
  R600ClauseMergePass.cpp \
  R600ControlFlowFinalizer.cpp \
  R600EmitClauseMarkers.cpp \
  R600ExpandSpecialInstrs.cpp \
  R600FrameLowering.cpp \
  R600InstrInfo.cpp \
  R600ISelLowering.cpp \
  R600MachineFunctionInfo.cpp \
  R600MachineScheduler.cpp \
  R600OpenCLImageTypeLoweringPass.cpp \
  R600OptimizeVectorRegisters.cpp \
  R600Packetizer.cpp \
  R600RegisterInfo.cpp \
  SIAddIMGInit.cpp \
  SIAnnotateControlFlow.cpp \
  SIFixSGPRCopies.cpp \
  SIFixVGPRCopies.cpp \
  SIPreAllocateWWMRegs.cpp \
  SIFoldOperands.cpp \
  SIFormMemoryClauses.cpp \
  SIFrameLowering.cpp \
  SIInsertHardClauses.cpp \
  SIInsertSkips.cpp \
  SIInsertWaitcnts.cpp \
  SIInstrInfo.cpp \
  SIISelLowering.cpp \
  SILoadStoreOptimizer.cpp \
  SILowerControlFlow.cpp \
  SILowerI1Copies.cpp \
  SILowerSGPRSpills.cpp \
  SIMachineFunctionInfo.cpp \
  SIMachineScheduler.cpp \
  SIMemoryLegalizer.cpp \
  SIOptimizeExecMasking.cpp \
  SIOptimizeExecMaskingPreRA.cpp \
  SIPeepholeSDWA.cpp \
  SIPostRABundler.cpp \
  SIPreEmitPeephole.cpp \
  SIProgramInfo.cpp \
  SIRegisterInfo.cpp \
  SIRemoveShortExecBranches.cpp \
  SIShrinkInstructions.cpp \
  SIWholeQuadMode.cpp \
  GCNILPSched.cpp \
  GCNRegBankReassign.cpp \
  GCNNSAReassign.cpp \
  GCNDPPCombine.cpp \
  SIModeRegister.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

TBLGEN_TABLES12 := $(amdgpu_codegen_TBLGEN_TABLES12)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM12AMDGPUCodeGen

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

TBLGEN_TABLES12 := $(amdgpu_codegen_TBLGEN_TABLES12)

LOCAL_SRC_FILES := $(amdgpu_codegen_SRC_FILES)

LOCAL_MODULE := libLLVM12AMDGPUCodeGen

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_TBLGEN_RULES_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
