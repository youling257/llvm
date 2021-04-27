ifeq ($(LLVM12_ROOT_PATH),)
$(error Must set variable LLVM12_ROOT_PATH before including this! $(LOCAL_PATH))
endif

CLEAR_TBLGEN_VARS12 := $(LLVM12_ROOT_PATH)/clear_tblgen_vars.mk
LLVM12_HOST_BUILD_MK := $(LLVM12_ROOT_PATH)/llvm-host-build.mk
LLVM12_DEVICE_BUILD_MK := $(LLVM12_ROOT_PATH)/llvm-device-build.mk
LLVM12_GEN_ATTRIBUTES_MK := $(LLVM12_ROOT_PATH)/llvm-gen-attributes.mk
LLVM12_GEN_INTRINSICS_MK := $(LLVM12_ROOT_PATH)/llvm-gen-intrinsics.mk
LLVM12_GEN_OMP_GEN_MK := $(LLVM12_ROOT_PATH)/llvm-gen-omp-gen.mk
LLVM12_GEN_OMP_CPP_MK := $(LLVM12_ROOT_PATH)/llvm-gen-omp-cpp.mk
LLVM12_TBLGEN_RULES_MK := $(LLVM12_ROOT_PATH)/llvm-tblgen-rules.mk

LLVM12_SUPPORTED_ARCH := arm arm64 mips mips64 x86 x86_64
