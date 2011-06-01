#############################################################
#
# mc
#
#############################################################
MC_VERSION = 4.7.5.2
MC_SITE = http://www.midnight-commander.org/downloads/
MC_DEPENDENCIES += ncurses
MC_CONF_OPT += \
	--with-screen=ncurses \
	--with-ncurses-libs=$(STAGING_DIR)/usr/lib \
	--with-ncurses-includes=$(STAGING_DIR)/usr/include \
	--disable-rpath

ifneq ($(BR2_LARGEFILE),y)
	MC_CONF_OPT += --disable-largefile
endif

# MC requires ncurses includes to be instlled in .../usr/include/ncurses 
# folder but not in .../usr/include.
define MC_FIX_NCURSES_INCLUDE_DIR
	/bin/mkdir -p $(STAGING_DIR)/usr/include/ncurses
	/bin/cp -dpf $(STAGING_DIR)/usr/include/curses.h $(STAGING_DIR)/usr/include/ncurses/curses.h
	/bin/cp -dpf $(STAGING_DIR)/usr/include/term.h $(STAGING_DIR)/usr/include/ncurses/term.h
	(cd $(STAGING_DIR)/usr/include/ncurses; /bin/ln -fs curses.h ncurses.h)
endef

MC_PRE_CONFIGURE_HOOKS += MC_FIX_NCURSES_INCLUDE_DIR

$(eval $(call AUTOTARGETS,package,mc))
