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

LLVM12_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM12_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS12)

LOCAL_MODULE := libLTO

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_lto_SRC_FILES := \
  lto.cpp \
  LTODisassembler.cpp

LOCAL_SRC_FILES := $(llvm_lto_SRC_FILES)

llvm_lto_STATIC_LIBRARIES := \
  libLLVM12Linker \
  libLLVM12ipo \
  libLLVM12DebugInfoDWARF \
  libLLVM12DebugInfoPDB \
  libLLVM12IRReader \
  libLLVM12BitWriter \
  libLLVM12BitReader \
  libLLVM12ARMCodeGen \
  libLLVM12ARMAsmParser \
  libLLVM12ARMAsmPrinter \
  libLLVM12ARMInfo \
  libLLVM12ARMDesc \
  libLLVM12ARMDisassembler \
  libLLVM12MipsCodeGen \
  libLLVM12MipsInfo \
  libLLVM12MipsDesc \
  libLLVM12MipsAsmParser \
  libLLVM12MipsAsmPrinter \
  libLLVM12MipsDisassembler \
  libLLVM12X86CodeGen \
  libLLVM12X86Info \
  libLLVM12X86Desc \
  libLLVM12X86AsmParser \
  libLLVM12X86AsmPrinter \
  libLLVM12X86Utils \
  libLLVM12X86Disassembler \
  libLLVM12AArch64CodeGen \
  libLLVM12AArch64Info \
  libLLVM12AArch64Desc \
  libLLVM12AArch64AsmParser \
  libLLVM12AArch64AsmPrinter \
  libLLVM12AArch64Utils \
  libLLVM12AArch64Disassembler \
  libLLVM12ExecutionEngine \
  libLLVM12RuntimeDyld \
  libLLVM12MCJIT \
  libLLVM12OrcJIT \
  libLLVM12AsmPrinter \
  libLLVM12SelectionDAG \
  libLLVM12CodeGen \
  libLLVM12Object \
  libLLVM12ScalarOpts \
  libLLVM12InstCombine \
  libLLVM12Instrumentation \
  libLLVM12TransformObjCARC \
  libLLVM12TransformUtils \
  libLLVM12Vectorize \
  libLLVM12Analysis \
  libLLVM12Target \
  libLLVM12MCDisassembler \
  libLLVM12MC \
  libLLVM12MCParser \
  libLLVM12Core \
  libLLVM12AsmParser \
  libLLVM12Option \
  libLLVM12LTO \
  libLLVM12Support \
  libLLVM12ProfileData

LOCAL_LDLIBS_darwin := -lpthread -ldl
LOCAL_LDLIBS_linux := -lpthread -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_lto_STATIC_LIBRARIES) $(llvm_lto_STATIC_LIBRARIES)

include $(LLVM12_HOST_BUILD_MK)
include $(LLVM12_GEN_ATTRIBUTES_MK)
include $(LLVM12_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
