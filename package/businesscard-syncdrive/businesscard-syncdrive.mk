################################################################################
#
# businesscard-syncdrive
#
################################################################################

BUSINESSCARD_SYNCDRIVE_SITE = $(BUSINESSCARD_SYNCDRIVE_PKGDIR)files
BUSINESSCARD_SYNCDRIVE_SITE_METHOD = local
BUSINESSCARD_SYNCDRIVE_LICENSE = Proprietary
BUSINESSCARD_SYNCDRIVE_DEPENDENCIES = host-genimage host-dosfstools host-mtools
BUSINESSCARD_INSTALL_IMAGES = YES
BUSINESSCARD_INSTALL_TARGET = NO

define BUSINESSCARD_SYNCDRIVE_BUILD_CMDS
	rm -rf "$(@D)/tmp"
	mkdir -p $(@D)/dummyroot
	$(HOST_DIR)/bin/genimage \
		--config $(@D)/genimage.cfg \
		--inputpath $(@D) \
		--outputpath $(@D) \
		--tmppath $(@D)/tmp \
		--rootpath $(@D)/dummyroot \
		--mcopy $(HOST_DIR)/bin/mcopy \
		--mkdosfs $(HOST_DIR)/sbin/mkfs.vfat

endef

define BUSINESSCARD_SYNCDRIVE_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)
	cp $(@D)/usbdrive.vfat $(BINARIES_DIR)/usbdrive.vfat
	$(INSTALL) -D -m 755 $(@D)/syncdrive.sh $(TARGET_DIR)/usr/bin/syncdrive
endef

$(eval $(generic-package))
