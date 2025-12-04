AESD_ASSIGNMENTS_VERSION = git
# REPLACE the following URL with your assignment-3 ssh repo (git@github.com:...)
AESD_ASSIGNMENTS_SITE = $(call git_url,git@github.com:YOUR-USERNAME/assignment-3-and-later.git)
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_LICENSE = GPL-2.0+
AESD_ASSIGNMENTS_INSTALL_TARGET = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC)"
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	install -D -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/finder-test.sh || true
	install -D -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/writer || true
	install -D -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh || true
	mkdir -p $(TARGET_DIR)/etc/finder-app
	cp -r $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/ || true
endef

$(eval $(generic-package))
