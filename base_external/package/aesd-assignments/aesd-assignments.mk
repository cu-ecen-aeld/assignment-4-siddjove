################################################################################
# AESD Assignments Buildroot Package
################################################################################

AESD_ASSIGNMENTS_VERSION = 1
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-siddjove.git

AESD_ASSIGNMENTS_INSTALL_STAGING = YES
AESD_ASSIGNMENTS_LICENSE = MIT

AESD_ASSIGNMENTS_INSTALL_TARGET = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D) CROSS_COMPILE=$(CROSS_COMPILE) CC="$(TARGET_CC)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf

	if [ -f $(@D)/finder-test.sh ]; then \
		$(INSTALL) -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh; \
	fi

	if [ -f $(@D)/finder.sh ]; then \
		$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh; \
	fi

	if [ -f $(@D)/writer ]; then \
		$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/writer; \
	fi

	if [ -d $(@D)/conf ]; then \
		$(CP) -r $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/; \
	fi
endef

$(eval $(generic-package))

