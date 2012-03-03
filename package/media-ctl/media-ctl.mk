#############################################################
#
# media-ctl
#
#############################################################

MEDIA_CTL_VERSION = 36a1357c9c879092fe2e36c82187f1d35b1efe13
MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
MEDIA_CTL_INSTALL_STAGING = YES
MEDIA_CTL_AUTORECONF = YES
MEDIA_CTL_AUTORECONF_OPT = --install

MEDIA_CTL_CONF_OPT = --with-kernel-headers=$(STAGING_DIR)/usr/include

$(eval $(call AUTOTARGETS))
