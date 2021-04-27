LOCAL_PATH:= $(call my-dir)

llvm_pre_static_libraries := \
  libLLVM12Linker \
  libLLVM12ipo \
  libLLVM12DebugInfoDWARF \
  libLLVM12DebugInfoPDB \
  libLLVM12Symbolize \
  libLLVM12DebugInfoMSF \
  libLLVM12DebugInfoCodeView \
  libLLVM12Demangle \
  libLLVM12IRReader \
  libLLVM12BitWriter \
  libLLVM12BitReader \
  libLLVM12BitstreamReader \
  libLLVM12GlobalISel \
  libLLVM12Passes

llvm_arm_static_libraries := \
  libLLVM12ARMCodeGen \
  libLLVM12ARMAsmParser \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMDisassembler \
  libLLVM12ARMUtils

llvm_x86_static_libraries := \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmParser \
  libLLVM12X86Disassembler

ifneq ($(filter radeonsi,$(BOARD_GPU_DRIVERS)),)
llvm_x86_static_libraries += \
  libLLVM12AMDGPUCodeGen \
  libLLVM12AMDGPUInfo \
  libLLVM12AMDGPUDesc \
  libLLVM12AMDGPUAsmParser \
  libLLVM12AMDGPUUtils \
  libLLVM12AMDGPUDisassembler
endif

llvm_mips_static_libraries := \
  libLLVM12MipsCodeGen \
  libLLVM12MipsInfo \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmParser \
  libLLVM12MipsDisassembler

llvm_aarch64_static_libraries := \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Info \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmParser \
  libLLVM12AArch64Utils \
  libLLVM12AArch64Disassembler

llvm_post_static_libraries := \
  libLLVM12AsmPrinter \
  libLLVM12SelectionDAG \
  libLLVM12CodeGen \
  libLLVM12Object \
  libLLVM12ScalarOpts \
  libLLVM12AggressiveInstCombine \
  libLLVM12InstCombine \
  libLLVM12Instrumentation \
  libLLVM12TransformObjCARC \
  libLLVM12TransformUtils \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12MCDisassembler \
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12Core \
  libLLVM12AsmParser \
  libLLVM12Option \
  libLLVM12Support \
  libLLVM12Vectorize \
  libLLVM12ProfileData \
  libLLVM12LibDriver \
  libLLVM12BinaryFormat \
  libLLVM12Coroutines \
  libLLVM12Remarks \
  libLLVM12MIRParser \
  libLLVM12TextAPI \
  libLLVM12CFGuard \
  libLLVM12FrontendOpenMP \
  libLLVM12HelloNew \
  libLLVM12OrcShared \
  libLLVM12OrcTargetProcess

llvm_host_static_libraries := \
  libLLVM12ExecutionEngine \
  libLLVM12RuntimeDyld \
  libLLVM12MCJIT \
  libLLVM12OrcJIT \
  libLLVM12JITLink

llvm_device_static_libraries := \
  libLLVM12ExecutionEngine \
  libLLVM12RuntimeDyld \
  libLLVM12MCJIT \
  libLLVM12OrcJIT \
  libLLVM12JITLink

# HOST LLVM shared library build
include $(CLEAR_VARS)
LOCAL_IS_HOST_MODULE := true

LOCAL_MODULE:= libLLVM12

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

include $(LLVM12_HOST_BUILD_MK)
include $(BUILD_HOST_SHARED_LIBRARY)

ifeq (,$(filter $(TARGET_ARCH),$(LLVM12_SUPPORTED_ARCH)))
$(warning TODO $(TARGET_ARCH): Enable llvm build)
endif

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
# DEVICE LLVM shared library build
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM12

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

include $(LLVM12_DEVICE_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_SHARED_LIBRARY)

endif
