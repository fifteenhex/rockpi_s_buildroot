BUILDROOT_ARGS=BR2_DEFCONFIG=../br2rockpis/configs/rockpis_defconfig \
        BR2_EXTERNAL="../br2rockpis ../br2autosshkey"

RKDEVELOPTOOL=sudo ./buildroot/output/host/bin/rkdeveloptool

.PHONY: buildroot clean

all: buildroot

buildroot:
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot rockpis_defconfig
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot

buildroot-menuconfig:
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot menuconfig
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot savedefconfig

buildroot-clean:
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot clean

linux-menuconfig:
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot linux-menuconfig

linux-rebuild:
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot linux-rebuild
	$(BUILDROOT_ARGS) $(MAKE) -C buildroot

rk_dumpflashinfo:
	$(RKDEVELOPTOOL) db br2rockpis/board/rockpis/rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin
	sleep 2
	$(RKDEVELOPTOOL) rid
	sleep 2
	$(RKDEVELOPTOOL) rd

uboot_loadviausb:
	$(RKDEVELOPTOOL) db br2rockpis/board/rockpis/rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin
	sleep 2
	$(RKDEVELOPTOOL) wl 0x40 buildroot/output/images/idbloader.img_sd
	sleep 2
	$(RKDEVELOPTOOL) rd

clean:	buildroot-clean
