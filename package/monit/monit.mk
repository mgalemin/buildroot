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
	$(INSTALL) -m 0755 $(@D)/src/monit $(TARGET_DIR)/usr/bin/monit
endef

define MONIT_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/monit
endef

$(eval $(call AUTOTARGETS,package,monit))
