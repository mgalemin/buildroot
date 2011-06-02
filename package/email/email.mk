#############################################################
#
# email
#
#############################################################
EMAIL_VERSION = 3.1.3
EMAIL_SITE = http://www.cleancode.org/downloads/email

ifeq ($(BR2_PACKAGE_OPENSSL),y)
EMAIL_CONF_OPT += --with-ssl
MONIT_DEPENDENCIES += openssl
endif

$(eval $(call AUTOTARGETS,package,email))
