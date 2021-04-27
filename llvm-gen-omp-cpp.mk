OMPCPP12 := $(LLVM12_ROOT_PATH)/include/llvm/Frontend/OpenMP/OMP.td

ifeq ($(LOCAL_MODULE_CLASS),)
	LOCAL_MODULE_CLASS := STATIC_LIBRARIES
endif

GENFILE := $(addprefix $(call local-generated-sources-dir)/lib/Frontend/OpenMP/,OMP.cpp)
LOCAL_GENERATED_SOURCES += $(GENFILE)
$(GENFILE): TBLGEN_LOCAL_MODULE := $(LOCAL_MODULE)
$(GENFILE): $(OMPCPP12) | $(LLVM12_TBLGEN)
ifeq ($(LOCAL_IS_HOST_MODULE),true)
	$(call transform-host-td-to-out12,directive-impl)
else
	$(call transform-device-td-to-out12,directive-impl)
endif
