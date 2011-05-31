#############################################################
#
# monit
#
#############################################################
MONIT_VERSION = 5.2.5
MONIT_SITE = http://mmonit.com/monit/dist/
MONIT_DIR = $(BUILD_DIR)/monit-$(MONIT_VERSION)
MONIT_SOURCE = monit-$(MONIT_VERSION).tar.gz
MONIT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

ifneq ($(BR2_PACKAGE_OPENSSL),y)
MONIT_CONF_OPT += --without-ssl
else
MONIT_CONF_OPT += \
	--with-ssl-incl-dir=$(STAGING_DIR)/usr/include \
	--with-ssl-lib-dir=$(STAGING_DIR)/usr/lib
MONIT_DEPENDENCIES += openssl
endif

$(eval $(call AUTOTARGETS,package/etherstack,monit))

$(MONIT_HOOK_POST_CONFIGURE):
	sed -i -e "s:-I/usr/include:-I$(STAGING_DIR)/usr/include:" \
	-e "s:-L/usr/lib:-L$(STAGING_DIR)/usr/lib:" $(MONIT_DIR)/Makefile;
