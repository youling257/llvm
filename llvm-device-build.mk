LOCAL_MODULE_TARGET_ARCH := $(LLVM80_SUPPORTED_ARCH)

LOCAL_CLANG := true

LOCAL_CFLAGS :=	\
	-D_GNU_SOURCE	\
	-D__STDC_LIMIT_MACROS	\
	-D__STDC_CONSTANT_MACROS	\
	-D__STDC_FORMAT_MACROS	\
	-O2	\
	-fomit-frame-pointer	\
	-Wall	\
	-W	\
	-Wno-unused-parameter	\
	-Wwrite-strings	\
	-Werror \
        -Dsprintf=sprintf \
	$(LOCAL_CFLAGS)

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
LOCAL_CFLAGS += \
	-DLLVM_BUILD_GLOBAL_ISEL
endif

# The three inline options together reduce libbcc.so almost 1MB.
# We move them from global build/core/combo/TARGET_linux-arm.mk
# to here.
LOCAL_CFLAGS := -DANDROID_TARGET_BUILD \
		-finline-functions \
		$(LOCAL_CFLAGS)

ifeq ($(TARGET_BUILD_VARIANT),eng)
LOCAL_CFLAGS := -DANDROID_ENGINEERING_BUILD \
                $(LOCAL_CFLAGS)
endif

ifeq ($(FORCE_BUILD_LLVM_DISABLE_NDEBUG),true)
LOCAL_CFLAGS :=	\
	$(LOCAL_CFLAGS) \
	-D_DEBUG	\
	-UNDEBUG
endif

ifneq ($(REQUIRES_EH),1)
LOCAL_CFLAGS +=	-fno-exceptions
else
# No action. The device target should not have exception enabled since bionic
# doesn't support it
REQUIRES_EH := 0
endif

ifneq ($(REQUIRES_RTTI),1)
LOCAL_CPPFLAGS +=	-fno-rtti
else
REQUIRES_RTTI := 0
endif

LOCAL_CPPFLAGS :=	\
	$(LOCAL_CPPFLAGS)	\
	-Woverloaded-virtual	\
	-Wno-sign-promo         \
	-std=c++11

# Make sure bionic is first so we can include system headers.
LOCAL_C_INCLUDES :=	\
	bionic \
	$(LLVM80_ROOT_PATH)	\
	$(LLVM80_ROOT_PATH)/include	\
	$(LLVM80_ROOT_PATH)/device/include	\
	$(LOCAL_C_INCLUDES)

###########################################################
## Commands for running tblgen to compile a td file
###########################################################
define transform-device-td-to-out80
@mkdir -p $(dir $@)
@echo "Device TableGen (gen-$(1)): $(TBLGEN_LOCAL_MODULE) <= $<"
$(hide) $(LLVM80_TBLGEN) \
	-I $(dir $<)	\
	-I $(LLVM80_ROOT_PATH)/include	\
	-I $(LLVM80_ROOT_PATH)/device/include	\
	-I $(LLVM80_ROOT_PATH)/lib/Target	\
    -gen-$(strip $(1)) \
    -o $@ $<
endef
