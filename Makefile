TOP ?= $(shell git rev-parse --show-toplevel)

.PHONY: tools
.DEFAULT: tools

include $(TOP)/Makefile.common
include $(TOP)/Makefile.tools

## This is the list of target directories that tools and libraries will be installed into
TARGET_DIRS := $(BP_BIN_DIR) $(BP_LIB_DIR) $(BP_INCLUDE_DIR) $(BP_TOUCH_DIR)
$(TARGET_DIRS):
	mkdir $@

sdk: | $(TARGET_DIRS)
	$(MAKE) gnu
	$(MAKE) dromajo

