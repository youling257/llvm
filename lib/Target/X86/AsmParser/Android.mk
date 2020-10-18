LOCAL_PATH := $(call my-dir)

# For the device only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

x86_asm_parser_SRC_FILES :=	\
	X86AsmParser.cpp

x86_asm_parser_TBLGEN_TABLES11 :=	\
	X86GenAsmMatcher.inc	\
	X86GenInstrInfo.inc	\
	X86GenRegisterInfo.inc \
	X86GenSubtargetInfo.inc

x86_asm_parser_TBLGEN_TD_DIR11 := $(LOCAL_PATH)/..

x86_asm_parser_C_INCLUDES +=	\
	$(LOCAL_PATH)/..


#===---------------------------------------------------------------===
# libX86AsmParser (host)
#===---------------------------------------------------------------===
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE:= libLLVM11X86AsmParser
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(x86_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(x86_asm_parser_C_INCLUDES)
TBLGEN_TABLES11 := $(x86_asm_parser_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(x86_asm_parser_TBLGEN_TD_DIR11)

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


#===---------------------------------------------------------------===
# libX86AsmParser (target)
#===---------------------------------------------------------------===
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE:= libLLVM11X86AsmParser
LOCAL_SRC_FILES := $(x86_asm_parser_SRC_FILES)
LOCAL_C_INCLUDES += $(x86_asm_parser_C_INCLUDES)
TBLGEN_TABLES11 := $(x86_asm_parser_TBLGEN_TABLES11)
TBLGEN_TD_DIR11 := $(x86_asm_parser_TBLGEN_TD_DIR11)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_TBLGEN_RULES_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
