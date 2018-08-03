LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libARMAsmParser (common)
#===---------------------------------------------------------------===

aarch64_asm_parser_SRC_FILES := \
  AArch64AsmParser.cpp

aarch64_asm_parser_TBLGEN_TABLES70 := \
  AArch64GenInstrInfo.inc \
  AArch64GenRegisterInfo.inc \
  AArch64GenAsmMatcher.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenSystemOperands.inc

aarch64_asm_parser_TBLGEN_TD_DIR70 := $(LOCAL_PATH)/..

aarch64_asm_parser_C_INCLUDES := $(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libAArch64AsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70AArch64AsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(aarch64_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(aarch64_asm_parser_C_INCLUDES)
TBLGEN_TABLES70 := $(aarch64_asm_parser_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(aarch64_asm_parser_TBLGEN_TD_DIR70)

include $(LLVM70_HOST_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
# Override the default optimization level to work around taking forever (~50m)
# to compile AArch64AsmParser.cpp on Mac with gcc 4.2,
# or on Linux with mingw32msvc-gcc 4.2, which is used to cross-compile
# the win_sdk.
LOCAL_CFLAGS_darwin += -O0
LOCAL_CFLAGS_windows += -O0
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libAArch64AsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS70)

LOCAL_MODULE:= libLLVM70AArch64AsmParser
LOCAL_SRC_FILES := $(aarch64_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(aarch64_asm_parser_C_INCLUDES)
TBLGEN_TABLES70 := $(aarch64_asm_parser_TBLGEN_TABLES70)
TBLGEN_TD_DIR70 := $(aarch64_asm_parser_TBLGEN_TD_DIR70)

include $(LLVM70_DEVICE_BUILD_MK)
include $(LLVM70_TBLGEN_RULES_MK)
include $(LLVM70_GEN_ATTRIBUTES_MK)
include $(LLVM70_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
