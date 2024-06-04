
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CHAR_DRIVER_VERSION = '4336e773c188155954e915397ddd1161fbb6c6bd'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-aahmed7.git'
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES

# AESD_CHAR_DRIVER_SITE = '/home/vcd/linux-1/assignments-3-and-later-aahmed7'
# AESD_CHAR_DRIVER_SITE_METHOD = local

AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(info installing required files)
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
