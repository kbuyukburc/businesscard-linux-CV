################################################################################
#
## python-numpyV1_8
#
#################################################################################

PYTHON_NUMPYV1_8_VERSION = 1.8.0
PYTHON_NUMPYV1_8_SOURCE = numpy-$(PYTHON_NUMPYV1_8_VERSION).tar.gz
PYTHON_NUMPYV1_8_SITE = http://downloads.sourceforge.net/numpy
PYTHON_NUMPYV1_8_LICENSE = BSD-3c
PYTHON_NUMPYV1_8_LICENSE_FILES = LICENSE.txt
PYTHON_NUMPYV1_8_SETUP_TYPE = distutils

ifeq ($(BR2_PACKAGE_CLAPACK),y)
PYTHON_NUMPYV1_8_DEPENDENCIES += clapack
PYTHON_NUMPYV1_8_SITE_CFG_LIBS += blas lapack
endif

define PYTHON_NUMPYV1_8_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_NUMPYV1_8_SITE_CFG_LIBS)) >> $(@D)/site.cfg
endef

# Some package may include few headers from NumPy, so let's install it
# # in the staging area.
PYTHON_NUMPYV1_8_INSTALL_STAGING = YES

$(eval $(python-package))

