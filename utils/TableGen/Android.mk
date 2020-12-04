LOCAL_PATH := $(call my-dir)
LLVM11_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM11_ROOT_PATH)/llvm.mk

tablegen_SRC_FILES := \
  AsmMatcherEmitter.cpp \
  AsmWriterEmitter.cpp \
  AsmWriterInst.cpp \
  Attributes.cpp \
  CallingConvEmitter.cpp \
  CodeEmitterGen.cpp \
  CodeGenDAGPatterns.cpp \
  CodeGenHwModes.cpp \
  CodeGenInstruction.cpp \
  CodeGenMapTable.cpp \
  CodeGenRegisters.cpp \
  CodeGenSchedule.cpp \
  CodeGenTarget.cpp \
  DAGISelEmitter.cpp \
  DAGISelMatcherEmitter.cpp \
  DAGISelMatcherGen.cpp \
  DAGISelMatcherOpt.cpp \
  DAGISelMatcher.cpp \
  DFAEmitter.cpp \
  DFAPacketizerEmitter.cpp \
  DirectiveEmitter.cpp \
  DisassemblerEmitter.cpp \
  ExegesisEmitter.cpp \
  FastISelEmitter.cpp \
  FixedLenDecoderEmitter.cpp \
  GICombinerEmitter.cpp \
  GlobalISelEmitter.cpp \
  InfoByHwMode.cpp \
  InstrDocsEmitter.cpp \
  InstrInfoEmitter.cpp \
  IntrinsicEmitter.cpp \
  OptEmitter.cpp \
  OptParserEmitter.cpp \
  OptRSTEmitter.cpp \
  PredicateExpander.cpp \
  PseudoLoweringEmitter.cpp \
  RISCVCompressInstEmitter.cpp \
  RegisterBankEmitter.cpp \
  RegisterInfoEmitter.cpp \
  SearchableTableEmitter.cpp \
  SDNodeProperties.cpp\
  SubtargetEmitter.cpp \
  SubtargetFeatureInfo.cpp \
  TableGen.cpp \
  Types.cpp \
  X86DisassemblerTables.cpp \
  X86EVEX2VEXTablesEmitter.cpp \
  X86FoldTablesEmitter.cpp \
  X86ModRMFilters.cpp \
  X86RecognizableInstr.cpp \
  WebAssemblyDisassemblerEmitter.cpp \
  CTagsEmitter.cpp \
  GlobalISel/CodeExpander.cpp \
  GlobalISel/GIMatchDag.cpp \
  GlobalISel/GIMatchDagEdge.cpp \
  GlobalISel/GIMatchDagInstr.cpp \
  GlobalISel/GIMatchDagOperands.cpp \
  GlobalISel/GIMatchDagPredicate.cpp \
  GlobalISel/GIMatchDagPredicateDependencyEdge.cpp \
  GlobalISel/GIMatchTree.cpp

include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

LOCAL_MODULE := llvm11-tblgen
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(tablegen_SRC_FILES)

REQUIRES_EH := 1
REQUIRES_RTTI := 1

LOCAL_STATIC_LIBRARIES := \
  libLLVM11TableGen \
  libLLVM11Support

LOCAL_LDLIBS += -lm
LOCAL_LDLIBS_windows := -limagehlp -lpsapi
LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

include $(LLVM11_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)
