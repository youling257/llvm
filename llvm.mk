ifeq ($(LLVM11_ROOT_PATH),)
$(error Must set variable LLVM11_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS11 := $(LLVM11_ROOT_PATH)/clear_tblgen_vars.mk
LLVM11_HOST_BUILD_MK := $(LLVM11_ROOT_PATH)/llvm-host-build.mk
LLVM11_DEVICE_BUILD_MK := $(LLVM11_ROOT_PATH)/llvm-device-build.mk
LLVM11_GEN_ATTRIBUTES_MK := $(LLVM11_ROOT_PATH)/llvm-gen-attributes.mk
LLVM11_GEN_INTRINSICS_MK := $(LLVM11_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM11_TBLGEN_RULES_MK := $(LLVM11_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM11_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
