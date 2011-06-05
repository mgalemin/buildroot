#############################################################
#
# valgrind
#
#############################################################

VALGRIND_VERSION=3.6.1
VALGRIND_SITE:=http://valgrind.org/downloads/
VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2

ifeq ($(BR2_arm),y)
# Fix host system architecture type (arm instead of armv7).
define VALGRIND_FIX_ARM_CONFIG
	sed -i -e "s:armv7:arm:" $(VALGRIND_DIR)/configure
endef

VALGRIND_PRE_CONFIGURE_HOOKS += VALGRIND_FIX_ARM_CONFIG
endif

$(eval $(call AUTOTARGETS,package,valgrind))
