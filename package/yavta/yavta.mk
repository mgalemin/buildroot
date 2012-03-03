#############################################################
#
# yavta
#
#############################################################

YAVTA_VERSION = 8cfc2a00fd09536d0e22b9da973bbe9829aaa0d4
YAVTA_SITE = git://git.ideasonboard.org/yavta.git

define YAVTA_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
endef

define YAVTA_INSTALL_TARGET_CMDS
	install -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
endef

$(eval $(call GENTARGETS))
