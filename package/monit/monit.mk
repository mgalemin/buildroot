#############################################################
#
# monit
#
#############################################################
MONIT_VERSION = 5.2.5
MONIT_SITE = http://mmonit.com/monit/dist/

ifneq ($(BR2_PACKAGE_OPENSSL),y)
MONIT_CONF_OPT += --without-ssl
else
MONIT_CONF_OPT += \
	--with-ssl-incl-dir=$(STAGING_DIR)/usr/include \
	--with-ssl-lib-dir=$(STAGING_DIR)/usr/lib
MONIT_DEPENDENCIES += openssl
endif

define MONIT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/monit $(TARGET_DIR)/usr/bin/monit
	$(INSTALL) -m 0644 $(@D)/monitrc $(TARGET_DIR)/etc/monitrc
	$(INSTALL) -d -m 0777 $(TARGET_DIR)/etc/monit.d
endef

define MONIT_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/monit
endef

$(eval $(call AUTOTARGETS,package,monit))
