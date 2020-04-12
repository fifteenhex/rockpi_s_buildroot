#!/bin/sh

set -e

#	-d output/images/rk3308_ddr_589MHz_uart2_m1_v1.30.bin \

mkimage \
	-n rk3308 \
	-T rksd \
	-d $BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/rk3308_ddr_589MHz_uart0_m0_v1.26.bin \
	output/images/idbloader.img_sd

mkimage \
	-n rk3308 \
	-T rkspi \
	-d $BR2_EXTERNAL_ROCKPIS_PATH/board/rockpis/rk3308_ddr_589MHz_uart0_m0_v1.26.bin \
	output/images/idbloader.img_spi


#cat output/images/u-boot-spl.bin >> output/images/idbloader.img

cat output/images/rk3308_miniloader_v1.19.bin >> output/images/idbloader.img_sd
