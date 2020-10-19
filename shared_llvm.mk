LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM11Linker \
  libLLVM11ipo \
  libLLVM11DebugInfoDWARF \
  libLLVM11DebugInfoPDB \
  libLLVM11Symbolize \
  libLLVM11DebugInfoMSF \
  libLLVM11DebugInfoCodeView \
  libLLVM11Demangle \
  libLLVM11IRReader \
  libLLVM11BitWriter \
  libLLVM11BitReader \
  libLLVM11BitstreamReader \
  libLLVM11GlobalISel \
  libLLVM11Passes

llvm_arm_static_libraries := \
  libLLVM11ARMCodeGen \
  libLLVM11ARMAsmParser \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMDisassembler \
  libLLVM11ARMUtils

llvm_x86_static_libraries := \
  libLLVM11X86CodeGen \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmParser \
  libLLVM11X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM11AMDGPUCodeGen \
  libLLVM11AMDGPUInfo \
  libLLVM11AMDGPUDesc \
  libLLVM11AMDGPUAsmParser \
  libLLVM11AMDGPUUtils \
  libLLVM11AMDGPUDisassembler
endif

llvm_mips_static_libraries := \
  libLLVM11MipsCodeGen \
  libLLVM11MipsInfo \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmParser \
  libLLVM11MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM11AsmPrinter \
  libLLVM11SelectionDAG \
  libLLVM11CodeGen \
  libLLVM11Object \
  libLLVM11ScalarOpts \
  libLLVM11AggressiveInstCombine \
  libLLVM11InstCombine \
  libLLVM11Instrumentation \
  libLLVM11TransformObjCARC \
  libLLVM11TransformUtils \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11MCDisassembler \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11Support \
  libLLVM11Vectorize \
  libLLVM11ProfileData \
  libLLVM11LibDriver \
  libLLVM11BinaryFormat \
  libLLVM11Coroutines \
  libLLVM11Remarks \
  libLLVM11MIRParser \
  libLLVM11TextAPI \
  libLLVM11CFGuard

llvm_host_static_libraries := \
  libLLVM11ExecutionEngine \
  libLLVM11RuntimeDyld \
  libLLVM11MCJIT \
  libLLVM11OrcJIT \
  libLLVM11OrcError \
  libLLVM11JITLink

llvm_device_static_libraries := \
  libLLVM11ExecutionEngine \
  libLLVM11RuntimeDyld \
  libLLVM11MCJIT \
  libLLVM11OrcJIT \
  libLLVM11OrcError \
  libLLVM11JITLink

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM11

LOCAL_MODULE_TAGS := optional

# Host build pulls in all ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries) \
  $(llvm_arm_static_libraries) \
  $(llvm_x86_static_libraries) \
  $(llvm_mips_static_libraries) \
  $(llvm_aarch64_static_libraries) \
  $(llvm_host_static_libraries) \
  $(llvm_post_static_libraries)

LOCAL_LDLIBS_windows := -limagehlp -lpsapi -lole32
LOCAL_LDLIBS_darwin := -ldl -lpthread
LOCAL_LDLIBS_linux := -ldl -lpthread

# Use prebuilts for linux and darwin unless
# FORCE_BUILD_LLVM_COMPONENTS is true
ifneq (true,$(FORCE_BUILD_LLVM_COMPONENTS))
LOCAL_MODULE_HOST_OS := linux
else
LOCAL_MODULE_HOST_OS := linux
endif

include $(LLVM11_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM11_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM11

LOCAL_MODULE_TAGS := optional

# Device build selectively pulls in ARM, Mips, X86 components.
LOCAL_WHOLE_STATIC_LIBRARIES := \
  $(llvm_pre_static_libraries)

LOCAL_WHOLE_STATIC_LIBRARIES_arm += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_x86_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_mips64 += $(llvm_mips_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_arm64 += $(llvm_arm_static_libraries)

ifeq ($(BUILD_ARM_FOR_X86),true)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86 += $(llvm_aarch64_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_arm_static_libraries)
LOCAL_WHOLE_STATIC_LIBRARIES_x86_64 += $(llvm_aarch64_static_libraries)
endif

LOCAL_WHOLE_STATIC_LIBRARIES += \
  $(llvm_device_static_libraries) \
  $(llvm_post_static_libraries)

LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_EXPORT_C_INCLUDE_DIRS := \
  $(LOCAL_PATH)/include \
  $(LOCAL_PATH)/device/include \
  $(call local-generated-sources-dir)

include $(LLVM11_DEVICE_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
