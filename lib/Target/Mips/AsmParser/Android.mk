LOCAL_PATH := $(call my-dir)

#===---------------------------------------------------------------===
# libLLVM11MipsAsmParser (common)
#===---------------------------------------------------------------===

mips_asm_parser_SRC_FILES := \
  MipsAsmParser.cpp

mips_asm_parser_C_INCLUDES := $(LOCAL_PATH)/..

mips_asm_parser_TBLGEN_TABLES11 := \
  MipsGenAsmMatcher.inc \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_asm_parser_TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libLLVM11MipsAsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE:= libLLVM11MipsAsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES11 := $(mips_asm_parser_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libLLVM11MipsAsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE:= libLLVM11MipsAsmParser
LOCAL_SRC_FILES := $(mips_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(mips_asm_parser_C_INCLUDES)
TBLGEN_TABLES11 := $(mips_asm_parser_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif
