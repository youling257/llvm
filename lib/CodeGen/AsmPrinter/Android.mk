LOCAL_PATH := $(call my-dir)

codegen_asmprinter_SRC_FILES := \
  AccelTable.cpp \
  AddressPool.cpp \
  AIXException.cpp \
  ARMException.cpp \
  AsmPrinter.cpp \
  AsmPrinterDwarf.cpp \
  AsmPrinterInlineAsm.cpp \
  DbgEntityHistoryCalculator.cpp \
  DebugHandlerBase.cpp \
  DebugLocStream.cpp \
  DIE.cpp \
  DIEHash.cpp \
  DwarfCFIException.cpp \
  DwarfCompileUnit.cpp \
  DwarfDebug.cpp \
  DwarfExpression.cpp \
  DwarfFile.cpp \
  DwarfStringPool.cpp \
  DwarfUnit.cpp \
  EHStreamer.cpp \
  ErlangGCPrinter.cpp \
  OcamlGCPrinter.cpp \
  PseudoProbePrinter.cpp \
  WinCFGuard.cpp \
  WinException.cpp \
  CodeViewDebug.cpp \
  WasmException.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_asmprinter_SRC_FILES)
LOCAL_MODULE:= libLLVM12AsmPrinter

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(codegen_asmprinter_SRC_FILES)
LOCAL_MODULE:= libLLVM12AsmPrinter

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
