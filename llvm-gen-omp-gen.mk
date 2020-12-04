OMPGEN11 := $(LLVM11_ROOT_PATH)/include/llvm/Frontend/OpenMP/OMP.td

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/Frontend/OpenMP/,OMP.h.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(OMPGEN11) | $(LLVM11_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out11,directive-decl)
else
	$(call transform-device-td-to-out11,directive-decl)
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/llvm/Frontend/OpenMP/,OMP.cpp.inc)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(OMPGEN11) | $(LLVM11_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out11,directive-gen)
else
	$(call transform-device-td-to-out11,directive-gen)
endif
