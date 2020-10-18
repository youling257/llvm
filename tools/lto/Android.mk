#
# Copyright (C) 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH:= $(call my-dir)

LLVM11_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM11_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS11)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM11Linker \
  libLLVM11ipo \
  libLLVM11DebugInfoDWARF \
  libLLVM11DebugInfoPDB \
  libLLVM11IRReader \
  libLLVM11BitWriter \
  libLLVM11BitReader \
  libLLVM11ARMCodeGen \
  libLLVM11ARMAsmParser \
  libLLVM11ARMAsmPrinter \
  libLLVM11ARMInfo \
  libLLVM11ARMDesc \
  libLLVM11ARMDisassembler \
  libLLVM11MipsCodeGen \
  libLLVM11MipsInfo \
  libLLVM11MipsDesc \
  libLLVM11MipsAsmParser \
  libLLVM11MipsAsmPrinter \
  libLLVM11MipsDisassembler \
  libLLVM11X86CodeGen \
  libLLVM11X86Info \
  libLLVM11X86Desc \
  libLLVM11X86AsmParser \
  libLLVM11X86AsmPrinter \
  libLLVM11X86Utils \
  libLLVM11X86Disassembler \
  libLLVM11AArch64CodeGen \
  libLLVM11AArch64Info \
  libLLVM11AArch64Desc \
  libLLVM11AArch64AsmParser \
  libLLVM11AArch64AsmPrinter \
  libLLVM11AArch64Utils \
  libLLVM11AArch64Disassembler \
  libLLVM11ExecutionEngine \
  libLLVM11RuntimeDyld \
  libLLVM11MCJIT \
  libLLVM11OrcJIT \
  libLLVM11AsmPrinter \
  libLLVM11SelectionDAG \
  libLLVM11CodeGen \
  libLLVM11Object \
  libLLVM11ScalarOpts \
  libLLVM11InstCombine \
  libLLVM11Instrumentation \
  libLLVM11TransformObjCARC \
  libLLVM11TransformUtils \
  libLLVM11Vectorize \
  libLLVM11Analysis \
  libLLVM11Target \
  libLLVM11MCDisassembler \
  libLLVM11MC \
  libLLVM11MCParser \
  libLLVM11Core \
  libLLVM11AsmParser \
  libLLVM11Option \
  libLLVM11LTO \
  libLLVM11Support \
  libLLVM11ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM11_HOST_BUILD_MK)
include $(LLVM11_GEN_ATTRIBUTES_MK)
include $(LLVM11_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
