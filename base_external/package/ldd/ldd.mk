
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 'c90b3a1848a8d5e4fdd28f6af4ca519ad4e551e7'
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-aahmed7.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules

define LDD_INSTALL_TARGET_CMDS
	$(info installing required files)
	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/misc-modules/module_load
	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/misc-modules/module_unload
	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/scull/scull_load
	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/scull/scull_unload
	sed -i 's?^insmod.*?insmod /lib/modules/5.15.120/extra/$$module.ko $$* || exit 1?' $(TARGET_DIR)/usr/bin/module_load
	sed -i 's?^insmod.*?insmod /lib/modules/5.15.120/extra/$$module.ko $$* || exit 1?' $(TARGET_DIR)/usr/bin/scull_load
endef

$(eval $(kernel-module))
$(eval $(generic-package))
