################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-siddjove.git
AESD_ASSIGNMENTS_SITE_METHOD = git

AESD_ASSIGNMENTS_DEPENDENCIES =

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/finder-app CC="$(TARGET_CC)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Scripts and binaries into /usr/bin
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/tester.sh $(TARGET_DIR)/usr/bin/tester.sh || true

	# Config files into /etc/finder-app/conf
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	cp -r $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
